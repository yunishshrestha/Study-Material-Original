okay
#include <stdio.h>
#include <math.h>
#include <time.h>
#include <unistd.h> // For sleep()

#define PI 3.14159265358979323846

void drawClock(int hours, int minutes, int seconds) {
    char clock[11][11];

    // Initialize clock face with spaces
    for (int i = 0; i < 11; i++) {
        for (int j = 0; j < 11; j++) {
            clock[i][j] = ' ';
        }
    }

    // Place clock boundary (circle)
    clock[0][5] = clock[5][0] = clock[5][10] = clock[10][5] = 'o';

    // Calculate positions for hour, minute, and second hands
    double secondAngle = (seconds * 6) * (PI / 180);
    double minuteAngle = (minutes * 6 + seconds * 0.1) * (PI / 180);
    double hourAngle = (hours % 12 * 30 + minutes * 0.5) * (PI / 180);

    int secX = 5 + (int)(4 * sin(secondAngle));
    int secY = 5 - (int)(4 * cos(secondAngle));

    int minX = 5 + (int)(3 * sin(minuteAngle));
    int minY = 5 - (int)(3 * cos(minuteAngle));

    int hourX = 5 + (int)(2 * sin(hourAngle));
    int hourY = 5 - (int)(2 * cos(hourAngle));

    // Place hands on the clock
    clock[secY][secX] = 's'; // Second hand
    clock[minY][minX] = 'm'; // Minute hand
    clock[hourY][hourX] = 'h'; // Hour hand

    // Print clock
    for (int i = 0; i < 11; i++) {
        for (int j = 0; j < 11; j++) {
            printf("%c ", clock[i][j]);
        }
        printf("\n");
    }
}

int main() {
    while (1) {
        time_t now = time(NULL);
        struct tm *local = localtime(&now);

        int hours = local->tm_hour;
        int minutes = local->tm_min;
        int seconds = local->tm_sec;

        // Clear the screen
        printf("\033[H\033[J");

        printf("Analog Clock Simulation\n");
        printf("------------------------\n");

        drawClock(hours, minutes, seconds);

        // Print the current time
        printf("\nCurrent Time: %02d:%02d:%02d\n", hours, minutes, seconds);

        // Wait for 1 second
        sleep(1);
    }

    return 0;
}
