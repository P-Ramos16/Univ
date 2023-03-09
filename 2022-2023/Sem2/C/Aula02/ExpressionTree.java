package Aula02;

import java.security.DrbgParameters.Reseed;
import java.util.Stack;

class Node {    
    String data;
    Node left,right;

    public Node(String data){
        this.data = data;
        this.left = this.right = null;
    }

    @Override
    public String toString() {
        return this.data;
    }

};

public class ExpressionTree {

    Stack<Node> nodeStack = new Stack<Node>();

    Node root;

    public ExpressionTree() {
        this.root = null;
    }
    
    public boolean insertNumber(String numData) {

        if (numData == "" || numData == null) {
            return false;
        }

        Node insertNode = new Node(numData);
        this.nodeStack.push(insertNode);

        return true;
    }

    public boolean insertOperator(String operData) throws Exception {

        if (operData == "" || operData == null) {
            return false;
        }

        Node insertNode = new Node(operData);

        try {
            insertNode.left = this.nodeStack.pop();
            insertNode.right = this.nodeStack.pop();
        }
        catch (Exception e) {
            throw new Exception("ERRO! Expressão Inválida.");
        }

        this.nodeStack.push(insertNode);

        return true;
    }


    public void printTree() {
        if (this.root == null) {
            this.root = this.nodeStack.pop();
        }
        System.out.print(0 + " | ROOT  -> ");
        printNodeTree(this.root, 1);
    }

    public void printNodeTree(Node rootNode, int level) {
        System.out.println(rootNode.toString());

        if (rootNode.left != null) {
            System.out.print(level + " | LEFT  -> ");
            printNodeTree(rootNode.left, level + 1);
        }

        if (rootNode.right != null) {
            System.out.print(level + " | RIGHT -> ");
            printNodeTree(rootNode.right, level + 1);
        }
    }

    public String printInfix() {
        if (this.root == null) {
            this.root = this.nodeStack.pop();
        }
        return printNodeInfix(this.root);
    }

    public String printNodeInfix(Node rootNode) {
        StringBuilder sb = new StringBuilder();

        if (rootNode.left != null) {
            sb.append(printNodeInfix(rootNode.left));
        }

        sb.append(rootNode.toString() + " ");

        if (rootNode.right != null) {
            sb.append(printNodeInfix(rootNode.right));
        }
        return sb.toString();
    }

    public void eval() throws Exception {

        Node currNode;
        String currVal;

        Double lastVal = 0.0;
        Double lastlastVal = 0.0;
        Double returnVal = 0.0;

        String[] expressionInfix = printInfix().split(" ");

        for (int nval = 0; nval < expressionInfix.length;) {

            if (isNumeric(expressionInfix[nval])) {
                lastlastVal = Double.parseDouble(expressionInfix[nval]);
                nval += 1;
                continue;
            }

            else {                
                lastVal = Double.parseDouble(expressionInfix[nval + 1]);
                switch(expressionInfix[nval]) {
                    case ("+"):
                        returnVal = lastlastVal + lastVal;
                        break;
    
                    case ("-"):
                        returnVal = lastlastVal - lastVal;
                        break;
                    
                    case ("/"):
                    case (":"):
                        returnVal = lastlastVal / lastVal;
                        break;
                    
                    case ("*"):
                    case ("x"):
                        returnVal = lastlastVal * lastVal;
                        break;
                    
                    default:
                        throw new Exception("Operador inválido! Utilize '+', '-', '*' ou '/'");
                }
                expressionInfix[nval + 1] = Double.toString(returnVal);
                nval += 1;
            }
        }

        System.out.println("\nResultado >>> " + returnVal);
    }

    public static boolean isNumeric(String string) {            
        if(string == null || string.equals("")) {
            return false;
        }

        try {
            Double intValue = Double.parseDouble(string);
            return true;
        } 
        catch (NumberFormatException e) {
            return false;
        }
    }
}
