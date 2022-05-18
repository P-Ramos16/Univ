package Aula09;

import java.util.*;

public class Ex02 {
    public static void main(String[] args) {
        int DIM[] = {1000, 5000, 10000, 20000, 40000, 100000};

        System.out.println("-------------------------------------------------------------------------");
        System.out.printf("%-12s | %8s, %8s, %8s, %8s, %8s, %8s","Collection", "1000", "5000", "10000", "20000", "40000", "100000");
        System.out.println();
        System.out.println("-------------------------------------------------------------------------");

        printVals(new ArrayList<>(), "ArrayList");
        printVals(new LinkedList<>(), "LinkedList");
        printVals(new Vector<>(), "Vector");
        printVals(new Stack<>(), "Stack");
        printVals(new ArrayDeque<>(), "ArrayDeque");
        printVals(new PriorityQueue<>(), "PriorityQ");
        printVals(new HashSet<>(), "HashSet");
        printVals(new LinkedHashSet<>(), "LinkedHash");
        printVals(new TreeSet<>(), "TreeSet");

        System.out.println("-------------------------------------------------------------------------");

    }

    private static void printVals(Collection<Integer> col, String name) {
        double[] result;
        double[][] printArray = new double[6][3];

        for (int i = 0; i < 6; i++) {
            result = checkPerformance(col, i);
            printArray[i][0] = result[0];
            printArray[i][1] = result[1];
            printArray[i][2] = result[2];
        }

        System.out.printf("%12s |", "");
        System.out.println();
        System.out.printf("%12s |", name);
        System.out.println();

        System.out.printf("%12s | %8s, %8s, %8s, %8s, %8s, %8s","Add", printArray[0][0], printArray[1][0], printArray[2][0], printArray[3][0], printArray[4][0], printArray[5][0]);
        System.out.println();
        System.out.printf("%12s | %8s, %8s, %8s, %8s, %8s, %8s","Search", printArray[0][1], printArray[1][1], printArray[2][1], printArray[3][1], printArray[4][1], printArray[5][2]);
        System.out.println();
        System.out.printf("%12s | %8s, %8s, %8s, %8s, %8s, %8s","Remove", printArray[0][2], printArray[1][2], printArray[2][2], printArray[3][2], printArray[4][2], printArray[5][1]);
        System.out.println();
    }

    private static double[] checkPerformance(Collection<Integer> col, int DIM) {
        double start, stop, delta;
        double[] res = {0, 0, 0};
        // Add

        start = System.nanoTime(); // clock snapshot before

        for(int i=0; i<DIM; i++ ) {
            col.add( i );
        }

        stop = System.nanoTime(); // clock snapshot after
        delta = (stop-start)/1e6; // convert to milliseconds
        res[0] = delta;

        // Search
        start = System.nanoTime(); // clock snapshot before
        for(int i=0; i<DIM; i++ ) {
            int n = (int) (Math.random()*DIM);
            if (!col.contains(n))
            System.out.println("Not found???"+n);
        }

        stop = System.nanoTime(); // clock snapshot after
        delta = (stop-start)/1e6; // convert nanoseconds to milliseconds
        res[1] = delta;

        
        // Remove
        start = System.nanoTime(); // clock snapshot before
        Iterator<Integer> iterator = col.iterator();
        while (iterator.hasNext()) {
            iterator.next();
            iterator.remove();
        }

        stop = System.nanoTime(); // clock snapshot after
        delta = (stop-start)/1e6; // convert nanoseconds to milliseconds
        res[2] = delta;

        

        return res;
    }
}
