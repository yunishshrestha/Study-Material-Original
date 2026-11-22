#include <stdio.h>

struct Process
{
    int pid;
    int burst_time;
    int priority;
    int waiting_time;
    int turn_around_time;
};

void sort(struct Process p[], int n)
{
    struct Process temp;

    for (int i = 0; i < n - 1; i++)
    {
        for (int j = 0; j < n - i - 1; j++)
        {
            if (p[j].priority > p[j + 1].priority)
            {
                temp = p[j];
                p[j] = p[j + 1];
                p[j + 1] = temp;
            }
        }
    }
}

int main()
{
    int n;
    float total_waiting_time = 0, total_turn_around_time = 0;

    printf("Enter number of processes: ");
    scanf("%d", &n);

    struct Process p[n];

    for (int i = 0; i < n; i++)
    {
        p[i].pid = i + 1;

        printf("\nEnter burst time for Process %d: ", i + 1);
        scanf("%d", &p[i].burst_time);

        printf("Enter priority for Process %d: ", i + 1);
        scanf("%d", &p[i].priority);
    }

    sort(p, n);

    p[0].waiting_time = 0;
    p[0].turn_around_time = p[0].burst_time;

    for (int i = 1; i < n; i++)
    {
        p[i].waiting_time = p[i - 1].waiting_time + p[i - 1].burst_time;
        p[i].turn_around_time = p[i].waiting_time + p[i].burst_time;
    }

    printf("\nPID\tPriority\tBurst Time\tWaiting Time\tTurn Around Time\n");

    for (int i = 0; i < n; i++)
    {
        printf("%d\t%d\t\t%d\t\t%d\t\t%d\n",
               p[i].pid,
               p[i].priority,
               p[i].burst_time,
               p[i].waiting_time,
               p[i].turn_around_time);

        total_waiting_time += p[i].waiting_time;
        total_turn_around_time += p[i].turn_around_time;
    }

    printf("\nAverage Waiting Time = %.2f", total_waiting_time / n);
    printf("\nAverage Turnaround Time = %.2f\n", total_turn_around_time / n);

    return 0;
}