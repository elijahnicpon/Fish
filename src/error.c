// error sound made by wav2c

const unsigned int error_sampleRate = 11025;
const unsigned int error_length = 5048;

const signed char error_data[] = {
4, 31, 31, 34, 53, 41, 31, 24, 22, 30, 32, 34, 51, 53, 45, 54, 54, 48, 45, 52, 64, 
73, 86, 93, 91, 84, 70, 47, 31, 33, 38, 54, 77, 91, 88, 81, 66, 46, 20, 7, 3, 
10, 29, 45, 52, 46, 26, 8, 6, 21, 33, 26, 14, -1, -9, -10, 8, 30, 39, 18, -21, 
-41, -32, -8, 9, 8, -2, -16, -30, -34, -24, -7, -11, -28, -49, -53, -47, -30, -11, -5, -10, 
-23, -49, -69, -83, -90, -90, -77, -53, -39, -33, -34, -47, -70, -84, -89, -89, -80, -66, -58, -47, 
-41, -44, -49, -49, -41, -46, -45, -28, -27, -26, -19, -21, -26, -32, -39, -24, -18, -19, -2, 15, 
18, 20, 34, 34, 23, 20, 18, 22, 27, 26, 40, 46, 39, 46, 49, 44, 40, 44, 54, 64, 
76, 87, 88, 82, 72, 50, 31, 31, 36, 47, 71, 86, 89, 81, 68, 50, 24, 8, 4, 6, 
24, 42, 50, 48, 31, 11, 5, 18, 31, 29, 16, 2, -7, -11, 2, 26, 39, 26, -14, -39, 
-35, -13, 7, 9, 0, -12, -26, -34, -26, -10, -7, -24, -45, -53, -48, -33, -14, -5, -7, -19, 
-42, -65, -79, -88, -91, -79, -58, -39, -34, -32, -42, -66, -81, -88, -89, -83, -68, -60, -49, -41, 
-42, -49, -49, -43, -43, -48, -31, -26, -28, -20, -20, -24, -31, -38, -29, -17, -19, -7, 12, 20, 
18, 32, 35, 26, 21, 17, 21, 26, 26, 35, 48, 40, 42, 49, 43, 40, 41, 53, 61, 73, 
85, 87, 84, 75, 54, 34, 29, 34, 44, 65, 84, 89, 82, 72, 54, 29, 10, 3, 6, 18, 
40, 48, 50, 35, 14, 4, 14, 29, 31, 19, 5, -7, -12, -3, 21, 38, 30, -4, -38, -37, 
-19, 5, 9, 3, -10, -24, -33, -29, -12, -6, -20, -40, -54, -49, -38, -17, -6, -6, -15, -36, 
-60, -78, -86, -91, -83, -63, -42, -35, -32, -39, -60, -79, -87, -89, -85, -71, -61, -52, -43, -41, 
-48, -49, -44, -42, -48, -36, -25, -27, -21, -18, -23, -30, -37, -33, -18, -21, -10, 8, 19, 17, 
28, 37, 27, 21, 18, 20, 25, 26, 31, 47, 41, 40, 49, 45, 40, 39, 50, 60, 69, 83, 
88, 85, 77, 60, 36, 30, 32, 41, 60, 81, 90, 85, 75, 59, 34, 13, 5, 5, 15, 35, 
48, 50, 40, 17, 4, 10, 27, 32, 22, 7, -5, -11, -6, 16, 36, 34, 5, -34, -40, -23, 
0, 11, 4, -6, -22, -31, -32, -16, -6, -15, -37, -52, -51, -41, -22, -7, -5, -13, -30, -56, 
-75, -84, -91, -86, -68, -45, -34, -33, -35, -56, -77, -85, -89, -86, -75, -62, -55, -43, -41, -45, 
-50, -46, -41, -47, -40, -25, -28, -23, -18, -23, -27, -35, -35, -20, -19, -15, 5, 18, 19, 23, 
38, 30, 22, 19, 17, 25, 26, 29, 44, 44, 39, 47, 47, 40, 39, 48, 58, 66, 80, 88, 
86, 79, 65, 40, 29, 31, 39, 54, 78, 89, 86, 76, 63, 40, 17, 4, 4, 11, 31, 47, 
50, 44, 22, 6, 6, 24, 32, 25, 11, -4, -10, -9, 10, 34, 37, 14, -27, -41, -29, -4, 
10, 7, -4, -17, -30, -34, -20, -6, -11, -32, -50, -53, -43, -26, -8, -4, -11, -25, -52, -71, 
-83, -90, -88, -72, -50, -35, -33, -33, -49, -74, -84, -89, -88, -77, -65, -55, -47, -39, -44, -50, 
-47, -41, -46, -44, -27, -26, -26, -18, -21, -27, -33, -37, -22, -17, -17, 1, 17, 19, 21, 35, 
33, 22, 19, 18, 22, 27, 27, 40, 47, 38, 46, 48, 42, 38, 45, 56, 65, 77, 87, 87, 
80, 69, 46, 29, 31, 36, 50, 73, 89, 87, 79, 66, 46, 21, 5, 4, 8, 27, 44, 51, 
46, 27, 7, 5, 19, 33, 28, 14, -1, -9, -11, 5, 29, 39, 22, -20, -42, -32, -9, 9, 
9, -2, -14, -29, -33, -25, -7, -9, -26, -48, -53, -46, -30, -12, -4, -9, -20, -45, -69, -81, 
-88, -90, -77, -54, -37, -33, -32, -45, -69, -83, -87, -89, -81, -66, -58, -48, -41, -43, -48, -49, 
-41, -43, -46, -30, -25, -27, -19, -19, -26, -32, -38, -27, -16, -20, -4, 15, 19, 19, 32, 36, 
23, 20, 18, 21, 27, 26, 37, 49, 39, 43, 48, 44, 38, 43, 54, 62, 74, 86, 88, 82, 
73, 50, 32, 29, 35, 46, 68, 87, 88, 81, 69, 51, 25, 8, 4, 6, 22, 41, 51, 48, 
33, 10, 4, 15, 32, 29, 17, 2, -8, -12, 0, 25, 40, 27, -10, -42, -36, -16, 8, 10, 
1, -12, -26, -34, -28, -11, -5, -23, -43, -55, -48, -34, -15, -3, -8, -17, -40, -64, -80, -87, 
-91, -81, -58, -39, -34, -32, -41, -63, -82, -87, -90, -83, -70, -58, -51, -41, -42, -47, -50, -43, 
-42, -47, -35, -24, -28, -21, -19, -24, -31, -37, -32, -17, -20, -9, 10, 21, 19, 29, 38, 27, 
19, 18, 20, 26, 27, 32, 48, 41, 41, 48, 46, 38, 41, 51, 62, 71, 84, 89, 83, 76, 
56, 34, 28, 34, 43, 62, 85, 89, 83, 72, 56, 30, 10, 2, 5, 17, 38, 50, 51, 37, 
15, 2, 12, 30, 31, 20, 5, -6, -12, -4, 19, 39, 33, 0, -38, -40, -21, 4, 11, 4, 
-8, -24, -33, -32, -14, -5, -17, -40, -53, -50, -39, -19, -5, -5, -14, -34, -59, -77, -86, -91, 
-84, -65, -42, -33, -33, -37, -58, -79, -88, -88, -86, -72, -61, -52, -42, -40, -46, -50, -45, -40, 
-47, -38, -24, -26, -23, -17, -22, -28, -36, -34, -18, -18, -13, 6, 20, 18, 26, 37, 30, 19, 
18, 18, 25, 26, 30, 46, 44, 39, 47, 48, 40, 38, 49, 59, 69, 81, 89, 85, 77, 62, 
37, 28, 32, 40, 57, 81, 90, 86, 74, 60, 36, 14, 2, 4, 12, 34, 48, 51, 41, 20, 
4, 7, 26, 33, 24, 8, -4, -11, -8, 13, 37, 37, 9, -32, -43, -26, -1, 13, 5, -5, 
-19, -32, -33, -19, -4, -13, -34, -52, -52, -41, -24, -6, -5, -11, -29, -54, -74, -85, -90, -88, 
-69, -46, -33, -32, -34, -52, -76, -86, -88, -88, -76, -63, -54, -45, -39, -45, -50, -48, -40, -46, 
-42, -27, -25, -26, -18, -21, -27, -35, -36, -22, -17, -16, 2, 18, 20, 21, 37, 32, 22, 17, 
18, 23, 26, 28, 41, 48, 38, 45, 48, 42, 37, 46, 57, 67, 78, 89, 86, 80, 67, 42, 
28, 30, 38, 53, 75, 91, 87, 78, 63, 43, 17, 4, 3, 10, 29, 46, 52, 45, 24, 6, 
4, 22, 33, 27, 12, -3, -10, -11, 7, 33, 39, 18, -24, -45, -31, -7, 12, 8, -3, -16, 
-30, -34, -24, -6, -9, -29, -51, -54, -45, -29, -9, -4, -9, -23, -49, -71, -84, -90, -89, -76, 
-50, -35, -31, -33, -46, -72, -86, -89, -88, -80, -64, -56, -47, -40, -42, -50, -48, -42, -43, -46, 
-29, -25, -26, -20, -19, -25, -34, -38, -26, -17, -17, -4, 17, 20, 20, 33, 36, 24, 18, 17, 
22, 26, 28, 37, 49, 41, 43, 49, 44, 37, 43, 55, 65, 76, 88, 88, 82, 69, 49, 29, 
29, 35, 49, 70, 89, 89, 80, 68, 47, 23, 4, 3, 7, 24, 43, 52, 47, 30, 8, 3, 
17, 34, 29, 16, -1, -9, -12, 2, 27, 41, 26, -15, -44, -38, -11, 9, 11, 0, -14, -27, 
-35, -27, -10, -5, -24, -46, -56, -47, -33, -12, -3, -7, -20, -42, -67, -81, -88, -90, -80, -56, 
-37, -31, -32, -43, -65, -85, -88, -88, -82, -69, -56, -49, -40, -41, -48, -51, -43, -42, -46, -33, 
-24, -25, -21, -18, -23, -31, -39, -30, -17, -17, -9, 13, 22, 19, 30, 37, 27, 18, 16, 21, 
26, 27, 35, 48, 42, 41, 47, 46, 39, 40, 53, 62, 73, 85, 90, 83, 74, 53, 32, 26, 
34, 44, 65, 86, 91, 83, 71, 52, 29, 8, 2, 6, 18, 40, 52, 49, 35, 12, 2, 11, 
31, 33, 18, 3, -9, -11, -4, 22, 41, 32, -4, -40, -43, -18, 6, 13, 2, -10, -25, -34, 
-31, -13, -4, -17, -42, -55, -51, -36, -17, -3, -5, -15, -37, -62, -80, -87, -90, -84, -62, -39, 
-32, -31, -38, -60, -81, -89, -90, -84, -72, -58, -51, -42, -40, -46, -51, -45, -41, -46, -39, -24, 
-24, -24, -18, -22, -29, -38, -33, -18, -17, -11, 8, 21, 21, 25, 38, 30, 20, 16, 19, 26, 
27, 32, 45, 46, 39, 46, 48, 40, 39, 48, 61, 71, 83, 89, 86, 75, 59, 36, 26, 32, 
42, 59, 83, 91, 86, 73, 58, 33, 10, 2, 3, 15, 36, 50, 51, 40, 18, 1, 8, 26, 
35, 24, 6, -6, -12, -7, 14, 38, 37, 7, -34, -47, -25, 2, 15, 7, -8, -21, -33, -33, 
-19, -3, -13, -36, -55, -53, -41, -21, -5, -3, -13, -30, -56, -77, -86, -90, -87, -68, -45, -31, 
-31, -36, -53, -78, -88, -90, -86, -75, -62, -52, -44, -39, -45, -50, -48, -40, -44, -42, -27, -23, 
-24, -19, -20, -28, -36, -37, -22, -15, -14, 3, 19, 22, 23, 36, 34, 22, 15, 18, 23, 28, 
29, 42, 47, 40, 44, 48, 42, 38, 46, 58, 69, 79, 89, 88, 79, 64, 41, 27, 28, 39, 
54, 78, 92, 89, 76, 62, 39, 16, 1, 2, 11, 31, 47, 53, 44, 22, 4, 3, 22, 34, 
28, 10, -4, -12, -9, 8, 34, 41, 17, -26, -47, -33, -4, 15, 9, -4, -18, -31, -34, -22, 
-5, -8, -29, -53, -56, -44, -25, -7, -2, -9, -26, -50, -74, -85, -91, -89, -73, -50, -32, -30, 
-35, -48, -73, -87, -91, -87, -78, -64, -53, -46, -39, -42, -50, -48, -42, -43, -43, -31, -23, -24, 
-20, -20, -25, -35, -37, -26, -16, -14, -3, 17, 22, 23, 32, 36, 24, 17, 16, 23, 28, 28, 
39, 48, 42, 43, 47, 44, 38, 43, 55, 67, 78, 87, 89, 81, 68, 46, 28, 27, 35, 51, 
72, 90, 90, 80, 64, 46, 20, 4, 0, 8, 25, 45, 53, 48, 28, 7, 1, 17, 33, 32, 
14, -2, -12, -11, 2, 29, 42, 25, -16, -47, -40, -12, 13, 13, 0, -15, -29, -36, -26, -9, 
-5, -23, -48, -57, -49, -30, -11, -1, -7, -20, -44, -69, -83, -90, -89, -79, -55, -36, -29, -32, 
-45, -66, -85, -91, -88, -81, -67, -55, -48, -40, -41, -47, -50, -44, -42, -45, -34, -24, -24, -21, 
-19, -24, -31, -39, -30, -18, -15, -6, 11, 23, 22, 30, 36, 28, 18, 16, 20, 27, 29, 36, 
47, 43, 42, 47, 45, 40, 40, 52, 63, 75, 85, 90, 84, 71, 52, 30, 26, 32, 47, 66, 
87, 92, 84, 68, 50, 26, 6, -1, 5, 20, 41, 52, 51, 35, 11, 1, 10, 31, 35, 21, 
2, -10, -12, -3, 23, 40, 34, -5, -42, -46, -19, 8, 16, 5, -13, -26, -35, -30, -14, -3, 
-17, -42, -58, -52, -36, -14, -2, -3, -16, -39, -63, -82, -89, -90, -83, -61, -39, -28, -31, -40, 
-62, -82, -92, -90, -84, -70, -58, -48, -41, -40, -45, -51, -45, -41, -45, -37, -25, -24, -21, -19, 
-23, -29, -37, -34, -20, -14, -8, 8, 22, 23, 27, 36, 30, 21, 15, 18, 25, 28, 32, 45, 
45, 42, 44, 46, 40, 40, 48, 61, 73, 83, 89, 84, 75, 57, 35, 24, 29, 41, 59, 80, 
88, 83, 68, 52, 29, 9, -1, 2, 14, 34, 48, 48, 37, 15, 0, 6, 23, 32, 22, 6, 
-8, -12, -6, 14, 33, 34, 5, -30, -43, -24, 1, 15, 7, -6, -20, -29, -27, -16, -3, -10, 
-28, -46, -45, -34, -15, -3, -1, -10, -25, -45, -62, -69, -71, -65, -52, -33, -23, -21, -28, -41, 
-59, -67, -68, -63, -54, -43, -37, -30, -28, -31, -36, -33, -30, -30, -28, -19, -16, -16, -13, -15, 
-18, -24, -25, -15, -10, -7, 1, 12, 14, 17, 21, 21, 14, 10, 9, 14, 16, 19, 25, 28, 
25, 26, 26, 25, 22, 26, 32, 40, 46, 49, 49, 43, 34, 22, 13, 15, 20, 30, 41, 49, 
47, 40, 31, 19, 6, 0, -1, 6, 15, 23, 27, 22, 10, 1, 0, 9, 15, 14, 5, -4, 
-6, -6, 3, 15, 17, 8, -12, -22, -16, -3, 7, 5, -1, -9, -13, -15, -9, -3, -3, -12, 
-20, -22, -18, -9, -3, 0, -3, -10, -19, -26, -31, -31, -31, -24, -17, -10, -10, -11, -17, -23, 
-29, -28, -28, -23, -19, -15, -13, -11, -13, -14, -14, -12, -13, -11, -9, -6, -6, -6, -5, -7, 
-8, -10, -6, -5, -3, 0, 3, 3, 5, 5, 6, 5, 2, 3, 2, 3, 5, 5, 6, 7, 
6, 7, 5, 6, 5, 6, 9, 9, 11, 11, 10, 8, 5, 2, 2, 2, 5, 7, 8, 8, 
7, 4, 3, 1, 0, -1, 0, 0, 2, 2, 2, 1, -1, -1, -1, 0, 0, 0, -1, -1, 
-2, -1, 0, -2, 1, 14, 21, 19, 26, 38, 35, 28, 22, 20, 18, 23, 27, 27, 30, 44, 
49, 44, 44, 49, 51, 46, 43, 42, 50, 57, 66, 74, 85, 93, 91, 89, 81, 67, 49, 34, 
32, 34, 40, 54, 72, 87, 94, 90, 84, 74, 58, 40, 19, 8, 4, 5, 13, 31, 44, 51, 
53, 43, 27, 12, 5, 12, 26, 33, 30, 20, 9, -2, -9, -11, -4, 17, 34, 39, 29, -2, 
-31, -42, -34, -17, 2, 10, 7, 0, -10, -24, -31, -35, -27, -13, -7, -13, -30, -46, -55, -53, 
-46, -31, -15, -7, -6, -10, -23, -42, -62, -76, -87, -92, -95, -88, -73, -54, -41, -36, -33, -36, 
-50, -70, -83, -90, -92, -93, -86, -74, -66, -58, -50, -43, -43, -48, -52, -50, -45, -44, -50, -44, 
-32, -28, -30, -24, -21, -21, -24, -30, -36, -39, -28, -19, -21, -16, -1, 11, 20, 18, 24, 37, 
37, 29, 24, 19, 19, 21, 27, 27, 29, 40, 49, 43, 42, 48, 51, 47, 42, 41, 46, 56, 
62, 72, 82, 91, 92, 87, 83, 69, 52, 35, 32, 33, 39, 50, 67, 85, 93, 90, 85, 76, 
61, 43, 23, 9, 5, 5, 11, 28, 41, 51, 52, 47, 31, 13, 6, 9, 23, 32, 31, 22, 
11, -2, -7, -12, -6, 13, 30, 40, 32, 6, -27, -41, -36, -22, -1, 9, 8, 2, -8, -21, 
-30, -35, -29, -15, -6, -11, -25, -44, -54, -54, -47, -35, -18, -7, -6, -9, -20, -38, -59, -73, 
-85, -91, -94, -91, -75, -58, -42, -37, -34, -36, -46, -65, -82, -88, -93, -93, -88, -76, -68, -59, 
-52, -44, -42, -48, -50, -51, -46, -43, -50, -46, -34, -27, -29, -25, -20, -20, -23, -28, -35, -39, 
-32, -20, -21, -18, -4, 10, 20, 19, 22, 34, 38, 29, 25, 20, 19, 21, 26, 28, 28, 38, 
49, 46, 41, 46, 51, 47, 44, 40, 45, 55, 62, 70, 80, 90, 91, 89, 83, 73, 54, 38, 
31, 34, 37, 46, 64, 81, 92, 91, 87, 77, 65, 47, 26, 11, 5, 5, 8, 23, 40, 48, 
53, 49, 33, 17, 5, 8, 19, 32, 31, 25, 13, 1, -6, -12, -8, 7, 28, 38, 36, 12, 
-21, -41, -38, -25, -4, 9, 9, 3, -5, -18, -30, -35, -31, -19, -7, -10, -23, -40, -52, -55, 
-48, -38, -21, -9, -5, -8, -16, -35, -54, -71, -83, -90, -94, -92, -79, -61, -44, -36, -34, -35, 
-43, -63, -78, -89, -91, -93, -89, -78, -69, -60, -54, -45, -42, -47, -50, -52, -47, -43, -48, -49, 
-36, -27, -29, -26, -22, -20, -24, -27, -34, -39, -34, -21, -20, -19, -8, 7, 17, 20, 19, 32, 
39, 31, 25, 20, 19, 19, 25, 28, 27, 35, 46, 47, 40, 45, 50, 49, 43, 41, 43, 53, 
60, 68, 78, 88, 92, 90, 85, 76, 58, 41, 31, 33, 36, 43, 61, 78, 91, 93, 88, 79, 
68, 50, 31, 13, 6, 5, 6, 21, 37, 47, 53, 50, 38, 20, 6, 6, 17, 30, 33, 25, 
16, 2, -5, -11, -10, 4, 24, 38, 37, 18, -15, -38, -40, -29, -8, 8, 10, 4, -4, -15, 
-27, -34, -33, -22, -8, -9, -19, -37, -51, -55, -50, -40, -25, -9, -5, -8, -13, -30, -50, -68, 
-82, -89, -94, -93, -83, -64, -47, -38, -34, -34, -40, -59, -76, -86, -92, -93, -92, -80, -71, -62, 
-56, -46, -42, -45, -50, -51, -48, -43, -46, -49, -40, -28, -29, -28, -22, -20, -22, -26, -33, -38, 
-37, -23, -20, -20, -11, 5, 16, 20, 18, 29, 38, 34, 25, 21, 19, 18, 24, 27, 27, 31, 
46, 48, 42, 43, 51, 49, 45, 41, 42, 51, 58, 66, 76, 87, 92, 91, 87, 78, 63, 43, 
32, 32, 35, 42, 57, 76, 89, 93, 88, 82, 71, 54, 35, 15, 6, 4, 6, 17, 34, 47, 
52, 52, 40, 23, 8, 5, 13, 29, 33, 28, 18, 6, -4, -9, -12, 0, 20, 36, 39, 24, 
-9, -36, -43, -31, -12, 5, 11, 5, -1, -14, -25, -33, -34, -25, -10, -6, -16, -34, -49, -56, 
-51, -43, -28, -13, -5, -7, -13, -25, -47, -65, -80, -87, -94, -94, -85, -69, -50, -38, -36, -33, 
-38, -54, -74, -85, -90, -93, -92, -84, -71, -64, -56, -49, -42, -44, -48, -52, -50, -44, -44, -51, 
-42, -29, -27, -29, -23, -20, -21, -25, -32, -37, -39, -25, -19, -21, -15, 2, 14, 21, 18, 26, 
38, 36, 26, 23, 19, 18, 23, 27, 27, 29, 43, 49, 43, 42, 49, 51, 45, 42, 41, 49, 
58, 64, 74, 84, 92, 90, 87, 80, 67, 47, 34, 30, 35, 39, 53, 71, 88, 94, 89, 83, 
74, 58, 39, 19, 6, 5, 4, 14, 31, 44, 52, 52, 44, 27, 10, 5, 10, 26, 34, 30, 
20, 8, -4, -9, -11, -4, 17, 33, 40, 29, -2, -32, -44, -34, -16, 2, 12, 7, -1, -10, 
-24, -32, -35, -27, -13, -5, -14, -30, -46, -56, -53, -45, -31, -15, -6, -6, -11, -21, -43, -62, 
-77, -86, -93, -94, -89, -72, -54, -40, -36, -33, -37, -49, -70, -83, -91, -92, -93, -85, -75, -64, 
-58, -50, -43, -42, -49, -51, -50, -45, -43, -50, -45, -32, -26, -30, -24, -20, -20, -25, -29, -37, 
-39, -30, -18, -21, -16, -2, 13, 21, 18, 23, 36, 38, 28, 23, 20, 18, 22, 27, 28, 29, 
40, 50, 45, 41, 48, 51, 47, 43, 40, 47, 55, 63, 72, 82, 90, 92, 87, 83, 70, 51, 
35, 30, 34, 39, 48, 68, 84, 94, 91, 85, 75, 62, 42, 23, 8, 5, 4, 11, 27, 42, 
51, 53, 46, 31, 12, 5, 8, 23, 33, 32, 23, 10, -1, -9, -11, -7, 12, 32, 40, 33, 
5, -27, -44, -37, -21, -1, 10, 9, 1, -7, -21, -31, -35, -30, -16, -5, -11, -25, -43, -55, 
-54, -48, -34, -19, -6, -5, -9, -18, -38, -58, -75, -84, -92, -94, -91, -76, -56, -42, -35, -33, 
-34, -46, -65, -83, -90, -92, -94, -88, -77, -66, -59, -51, -43, -42, -46, -51, -52, -46, -43, -48, 
-49, -34, -27, -28, -27, -20, -20, -23, -28, -36, -39, -33, -19, -20, -18, -6, 11, 20, 19, 21, 
33, 39, 30, 24, 20, 19, 19, 26, 28, 27, 37, 48, 47, 40, 46, 51, 48, 42, 41, 45, 
54, 61, 70, 79, 90, 93, 89, 83, 74, 55, 38, 30, 33, 38, 46, 63, 83, 92, 93, 86, 
78, 65, 46, 27, 10, 5, 4, 9, 22, 40, 49, 54, 49, 35, 16, 4, 7, 20, 33, 33, 
25, 13, 1, -7, -12, -9, 6, 28, 39, 37, 12, -21, -42, -41, -24, -4, 9, 11, 2, -5, 
-19, -29, -35, -32, -19, -7, -8, -21, -41, -53, -56, -49, -38, -21, -8, -4, -8, -17, -33, -54, 
-72, -83, -90, -95, -92, -79, -61, -43, -37, -34, -35, -42, -62, -79, -88, -92, -93, -91, -79, -68, 
-60, -54, -45, -42, -45, -51, -52, -48, -42, -46, -50, -37, -27, -27, -27, -22, -19, -23, -27, -34, 
-39, -36, -21, -18, -19, -9, 8, 18, 21, 19, 30, 40, 33, 25, 21, 18, 20, 24, 29, 27, 
34, 47, 48, 42, 43, 51, 49, 44, 41, 42, 52, 61, 67, 78, 87, 93, 89, 85, 76, 60, 
40, 30, 31, 37, 43, 60, 78, 92, 93, 88, 80, 68, 52, 31, 12, 5, 3, 7, 18, 37, 
48, 54, 51, 38, 20, 5, 5, 16, 30, 35, 26, 16, 3, -6, -12, -10, 3, 23, 39, 38, 
20, -14, -41, -43, -30, -8, 7, 12, 5, -5, -15, -28, -34, -34, -22, -9, -6, -18, -37, -52, 
-56, -52, -40, -26, -9, -3, -8, -13, -28, -51, -69, -82, -89, -94, -93, -84, -65, -47, -36, -34, 
-34, -39, -57, -76, -88, -91, -92, -92, -81, -70, -61, -55, -46, -41, -45, -49, -53, -49, -43, -45, 
-49, -42, -28, -27, -28, -24, -18, -21, -27, -32, -39, -37, -24, -18, -19, -13, 4, 17, 22, 20, 
26, 39, 36, 25, 21, 18, 19, 22, 28, 28, 30, 44, 49, 44, 41, 50, 51, 45, 41, 41, 
50, 58, 67, 74, 86, 92, 92, 85, 79, 63, 45, 30, 31, 36, 41, 55, 74, 90, 94, 90, 
81, 71, 56, 34, 16, 4, 4, 5, 16, 32, 48, 53, 51, 42, 23, 8, 4, 12, 28, 35, 
30, 19, 5, -4, -10, -12, -1, 19, 37, 40, 26, -7, -37, -46, -33, -14, 6, 12, 7, -2, 
-12, -26, -33, -36, -26, -10, -5, -14, -33, -49, -57, -53, -44, -28, -12, -4, -5, -13, -24, -45, 
-66, -79, -89, -93, -95, -86, -69, -51, -37, -35, -33, -38, -52, -73, -86, -92, -92, -93, -84, -73, 
-62, -57, -48, -42, -43, -48, -53, -50, -45, -43, -50, -44, -31, -25, -29, -25, -20, -20, -26, -31, 
-37, -39, -28, -18, -18, -15, -1, 16, 22, 19, 24, 36, 39, 28, 21, 18, 19, 22, 27, 28, 
29, 41, 50, 46, 40, 47, 51, 47, 41, 41, 47, 58, 64, 73, 83, 92, 93, 88, 81, 68, 
49, 32, 29, 33, 40, 51, 71, 87, 95, 92, 83, 74, 58, 40, 19, 6, 2, 5, 13, 29, 
44, 53, 53, 45, 28, 10, 3, 8, 25, 34, 32, 20, 9, -3, -9, -13, -5, 13, 35, 42, 
31, 2, -32, -46, -38, -18, 3, 12, 10, -1, -10, -22, -33, -35, -30, -14, -5, -10, -28, -46, 
-56, -55, -45, -33, -15, -5, -4, -11, -21, -41, -61, -77, -87, -92, -95, -89, -74, -53, -40, -33, 
-34, -35, -48, -67, -85, -91, -92, -93, -86, -76, -64, -58, -50, -44, -41, -47, -51, -51, -45, -42, 
-48, -47, -35, -25, -27, -27, -20, -20, -23, -30, -36, -40, -31, -20, -18, -17, -5, 12, 21, 21, 
21, 33, 40, 31, 23, 18, 18, 21, 26, 29, 29, 38, 48, 48, 41, 45, 50, 49, 42, 40, 
44, 55, 64, 70, 81, 91, 93, 89, 82, 71, 53, 34, 29, 31, 39, 49, 66, 84, 95, 92, 
86, 75, 63, 44, 24, 7, 3, 3, 10, 24, 42, 51, 54, 48, 32, 14, 2, 6, 20, 34, 
35, 23, 11, -2, -8, -13, -9, 9, 30, 43, 35, 10, -26, -46, -43, -23, -1, 13, 11, 3, 
-9, -20, -30, -35, -32, -17, -6, -7, -23, -43, -55, -57, -48, -35, -19, -6, -3, -9, -18, -35, 
-57, -74, -85, -92, -94, -91, -78, -59, -41, -34, -33, -35, -44, -64, -81, -92, -93, -92, -89, -78, 
-67, -59, -51, -45, -41, -45, -50, -52, -47, -42, -47, -48, -38, -26, -26, -26, -23, -19, -22, -28, 
-34, -39, -35, -21, -17, -17, -9, 8, 20, 22, 21, 30, 38, 35, 25, 19, 18, 20, 25, 29, 
29, 34, 47, 49, 43, 42, 50, 49, 45, 39, 43, 52, 62, 70, 78, 89, 93, 91, 83, 74, 
57, 39, 29, 29, 37, 45, 62, 80, 94, 95, 88, 77, 66, 48, 28, 9, 3, 3, 7, 21, 
39, 50, 55, 50, 37, 18, 3, 4, 16, 32, 35, 28, 13, 1, -9, -12, -11, 4, 25, 41, 
40, 17, -17, -44, -46, -29, -5, 11, 13, 5, -6, -17, -29, -36, -33, -22, -7, -6, -18, -38, 
-55, -58, -51, -38, -22, -8, -2, -6, -15, -31, -53, -71, -85, -90, -95, -92, -83, -63, -45, -34, 
-33, -33, -41, -58, -77, -90, -93, -93, -91, -80, -69, -59, -53, -46, -41, -43, -49, -52, -49, -42, 
-44, -46, -40, -28, -23, -26, -22, -19, -19, -25, -31, -37, -34, -24, -15, -16, -10, 4, 16, 21, 
18, 25, 34, 32, 24, 16, 15, 16, 21, 25, 25, 28, 37, 43, 39, 35, 40, 41, 39, 34, 
34, 40, 49, 55, 63, 70, 76, 74, 69, 62, 48, 34, 22, 22, 26, 34, 44, 59, 70, 73, 
69, 60, 52, 39, 25, 9, 2, 1, 4, 13, 25, 34, 40, 37, 29, 15, 4, 0, 8, 20, 
24, 21, 12, 2, -4, -8, -9, 0, 12, 25, 28, 16, -5, -25, -32, -22, -7, 4, 9, 4, 
-2, -10, -16, -22, -21, -16, -6, -3, -8, -20, -30, -34, -31, -25, -15, -7, -1, -3, -7, -16, 
-26, -37, -44, -49, -50, -49, -46, -35, -26, -18, -17, -17, -20, -27, -37, -43, -47, -45, -45, -40, 
-35, -30, -25, -23, -19, -20, -22, -24, -23, -21, -19, -21, -19, -15, -11, -11, -10, -9, -8, -10, 
-14, -15, -16, -12, -7, -7, -5, -1, 5, 7, 7, 9, 11, 13, 9, 7, 5, 6, 6, 9, 
8, 10, 13, 14, 14, 13, 13, 15, 14, 11, 11, 13, 15, 18, 19, 23, 24, 23, 23, 20, 
15, 11, 7, 5, 7, 8, 12, 15, 20, 21, 19, 17, 14, 11, 7, 2, 0, -1, 0, 1, 
5, 7, 9, 8, 7, 4, 0, 0, 0, 3, 4, 4, 2, 1, -2, -2, -2, -2, 1, 3, 
3, 3, -1, -4, -5, -4, -2, 0, 1, -1, 0, -2, -3, -2, -3, -2, -2, -1, -1, -1, 
-2, -3, -2, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, 0, -1, 0, -1, 0, -2, 0, 
-2, 0, -1, -1, 0, 0, -1, -1, -1, -1, 0, 0, -1, -1, 0, -1, -1, -1, -1, 0, 
-1, 0, -1, -1, -1, -2, 0, -1, 0, 0, -2, 0, -1, 0, -1, 0, 0, -1, 0, -1, 
0, -1, 0, -1, 0, -1, 0, 0, -1, -1, -1, -1, 0, -1, -1, -1, 0, -2, 0, -2, 
-1, -1, -1, -1, -1, -2, 0, -2, 0, -2, 0, -2, 0, -2, 0, -2, -1, -1, -1, 0, 
-1, -1, -1, -1, -1, 0, -2, 0, -2, 0, -2, 0, -1, -1, 0, -1, 0, -2, 0, -1, 
0, -1, -1, -1, 0, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -2, 0, 
-2, 0, -2, -1, -1, -1, -1, 0, -2, -1, -1, -1, -1, -1, 0, -1, 0, -1, 0, -2, 
0, -1, -1, -1, -1, 0, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, 0, -2, 0, -2, 
0, -1, -1, -1, 0, -2, 0, -1, -1, 0, -2, 0, -2, 0, -1, -1, -1, 0, -2, 0, 
-1, -1, -1, -1, -1, 0, -2, 0, -2, -1, -1, -1, -1, -1, 0, -2, 0, -1, 0, -1, 
-1, -1, -1, 0, -1, -1, -1, 0, -1, -1, -1, -2, 0, -2, 0, -2, 0, -1, -1, 0, 
-1, 0, -2, 0, -2, -1, -1, -1, 0, -2, 0, -1, -1, 0, -2, 0, -1, -1, 0, -1, 
-1, -1, -1, -1, 0, -1, 0, 0, -2, 0, -1, 0, -1, -1, -1, -1, -1, -1, 0, -1, 
0, -1, 0, -2, 0, 0, -1, -1, 0, -1, 0, -1, -1, -1, 0, -1, -1, -1, 0, -2, 
0, -2, 0, -2, -1, -1, -1, 0, 0, -1, 0, -1, -1, -1, -1, -1, -1, 0, 0, -1, 
-1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, 0, -2, 0, -1, -1, 0, -2, 0, -1, 
-1, 0, -1, -1, -1, -1, 0, -2, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, 
0, 0, -1, -1, -1, 0, -1, 0, -2, 0, -2, 0, -2, -1, -1, -1, -1, -1, 0, -1, 
-1, 0, -2, 0, -2, -1, -1, -1, -1, 0, -1, -1, -1, -1, 0, -2, 0, -1, -1, -1, 
-1, -1, 0, -1, -1, -1, -1, 0, -2, 0, -2, 0, -2, 0, -1, -1, -1, -1, -2, 0, 
-2, -1, -1, -2, 0, -1, -1, -1, -1, -1, -1, -1, -1, 0, 0, -1, 0, -1, -1, 0, 
-2, 0, 0, -2, 0, -1, -1, -1, -1, 0, -2, 0, -1, 0, -2, 0, -2, 0, -2, 0, 
-2, 0, -2, 0, -1, -1, 0, -2, 0, -2, 0, -1, -1, -1, -1, -1, -1, 0, -1, 0, 
-1, 0, -1, 0, -1, 0, -2, 0, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1, -1, -1, 
-1, 0, -2, -1, 0, -2, 0, -2, 0, 0, -1, -1, 0, -1, 0, -1, 0, -1, -1, -1, 
0, -1, -1, -1, -1, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, -2, 0, -2, 0, 
-2, 0, 0, -1, 0, -2, 0, -2, 0, 0, -2, 0, 0, -2, 0, -2, 0, -2, 0, -1, 
-1, -1, -1, -1, -1, -1, -1, -1, 0, -2, 0, -1, 0, -1, -1, -1, 0, -2, 0, -2, 
0, -2, 0, -1, -1, -1, -1, -1, 0, -2, 0, -1, -1, 0, -2, 0, -1, 0, 0, -1, 
0, 0, -1, 0, -1, -1, -1, -1, -1, -1, 0, -1, 0, -1, -1, 0, -2, 0, -2, 0, 
-2, 0, -1, 0, -1, 0, -2, 0, -2, 0, -1, -2, 0, -2, 0, -2, 0, -1, 0, 0, 
-1, 0, -1, 0, -1, 0, -1, };
