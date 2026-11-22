#include <stdio.h>
struct Process
{
    int pid;
    int burst_time;
    int remaining_burst_time;
    int waiting_time;
    int turn_around_time;
};

int main()
{
    int n, quantum;
    int count = 0;
    int tempTAT = 0;

    float total_waiting_time = 0;
    float total_turn_around_time = 0;

    printf("Enter number of processes: ");
    scanf("%d", &n);

    struct Process p[n];

    for (int i = 0; i < n; i++)
    {
        p[i].pid = i + 1;

        printf("Enter burst time for Process %d: ", i + 1);
        scanf("%d", &p[i].burst_time);

        p[i].remaining_burst_time = p[i].burst_time;
    }

    printf("Enter Time Quantum: ");
    scanf("%d", &quantum);

    while (1)
    {
        count = 0;
        for (int i = 0; i < n; i++)
        {
            if (p[i].remaining_burst_time == 0)
            {
                count++;
                continue;
            }

            if (p[i].remaining_burst_time > quantum)
            {
                tempTAT += quantum;
                p[i].remaining_burst_time -= quantum;
            }
            else if (p[i].remaining_burst_time > 0)
            {
                tempTAT += p[i].remaining_burst_time;

                p[i].turn_around_time = tempTAT;
                p[i].waiting_time =
                    p[i].turn_around_time - p[i].burst_time;

                p[i].remaining_burst_time = 0;
            }
        }
        if (count == n)
            break;
    }

    printf("\nPID\tBurst Time\tWaiting Time\tTurn Around Time\n");

    for (int i = 0; i < n; i++)
    {
        printf("%d\t%d\t\t%d\t\t%d\n",
               p[i].pid,
               p[i].burst_time,
               p[i].waiting_time,
               p[i].turn_around_time);

        total_waiting_time += p[i].waiting_time;
        total_turn_around_time += p[i].turn_around_time;
    }

    printf("\nAverage Waiting Time = %.2f",
           total_waiting_time / n);

    printf("\nAverage Turnaround Time = %.2f\n",
           total_turn_around_time / n);

    return 0;
}