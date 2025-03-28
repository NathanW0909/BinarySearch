public class Sketch {
    private Item[] store = {
        new Item(184, 14), new Item(196, 60), new Item(206, 31), new Item(2370, 65), 
        new Item(7282, 73), new Item(8303, 90), new Item(12328, 63), new Item(12705, 14), 
        new Item(13066, 8), new Item(14088, 92), new Item(15320, 82), new Item(15814, 60), 
        new Item(15917, 51), new Item(17911, 96), new Item(18061, 3), new Item(18410, 56), 
        new Item(18465, 27), new Item(18618, 64), new Item(18871, 69), new Item(19967, 45)
    };

    public int linearSearch(int catNumToFind) {
        for (int i = 0; i < store.length; i++) {
            if (store[i].getCatNum() == catNumToFind) {
                return store[i].getInventory();
            }
        }
        return -1;
    }

    public int recursiveLinearSearch(int catNumToFind, int startIndex) {
        if (startIndex >= store.length) {
            return -1;
        }
        if (store[startIndex].getCatNum() == catNumToFind) {
            return store[startIndex].getInventory();
        }
        return recursiveLinearSearch(catNumToFind, startIndex + 1);
    }

    public int binarySearch(int catNumToFind) {
        int low = 0, high = store.length - 1;
        while (low <= high) {
            int mid = (low + high) / 2;
            if (store[mid].getCatNum() == catNumToFind) {
                return store[mid].getInventory();
            } else if (store[mid].getCatNum() < catNumToFind) {
                low = mid + 1;
            } else {
                high = mid - 1;
            }
        }
        return -1;
    }

    public int recursiveBinarySearch(int catNumToFind, int low, int high) {
        if (low > high) {
            return -1;
        }
        int mid = (low + high) / 2;
        if (store[mid].getCatNum() == catNumToFind) {
            return store[mid].getInventory();
        } else if (store[mid].getCatNum() < catNumToFind) {
            return recursiveBinarySearch(catNumToFind, mid + 1, high);
        } else {
            return recursiveBinarySearch(catNumToFind, low, mid - 1);
        }
    }

    public void tester() {
        int[] tests = {0, 183, 184, 2370, 15320, 19967, 19968};
        
        System.out.println("\nTesting Non-Recursive Linear Search");
        for (int test : tests) {
            printResult(test, linearSearch(test));
        }

        System.out.println("\nTesting Recursive Linear Search");
        for (int test : tests) {
            printResult(test, recursiveLinearSearch(test, 0));
        }

        System.out.println("\nTesting Non-Recursive Binary Search");
        for (int test : tests) {
            printResult(test, binarySearch(test));
        }

        System.out.println("\nTesting Recursive Binary Search");
        for (int test : tests) {
            printResult(test, recursiveBinarySearch(test, 0, store.length - 1));
        }
    }

    private void printResult(int catNum, int result) {
        if (result != -1) {
            System.out.println("Catalog #" + catNum + " has " + result + " in stock");
        } else {
            System.out.println("Catalog #" + catNum + " not found");
        }
    }

    public void draw() {
        // Empty
    }

    public static void main(String[] args) {
        Sketch sketch = new Sketch();
        sketch.tester();
    }
}




