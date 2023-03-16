@SuppressWarnings("CheckReturnValue")
public class Execute extends CalculatorBaseVisitor<Integer> {

   @Override public Integer visitProgram(CalculatorParser.ProgramContext ctx) {
      Integer res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public Integer visitStat(CalculatorParser.StatContext ctx) {
      Integer res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public Integer visitExprAddSub(CalculatorParser.ExprAddSubContext ctx) {
        Integer num0 = (Integer)visit(ctx.expr(0));
        Integer num1 = (Integer)visit(ctx.expr(1));
        Integer res = null;

        if (num0 != null && num1 != null) {
                switch(ctx.op.getText()) {
                        case "+":
                                res = num0 + num1;
                                break;
                        case "-":
                                res = num0 - num1;
                                break;
                        default:
                                System.out.println("Erro! Essa operação não é suportada!");
                                break;
                }
                System.out.println("Resultado > " +  res);
        }
        else {
                System.out.println("Erro! Os números inseridos são inválidos!");
        }

        return res;

   }

   @Override public Integer visitExprParent(CalculatorParser.ExprParentContext ctx) {
	return visit(ctx.expr());
   }

   @Override public Integer visitExprInteger(CalculatorParser.ExprIntegerContext ctx) {
	return Integer.parseInt(ctx.Integer().getText());
   }

   @Override public Integer visitExprMultDivMod(CalculatorParser.ExprMultDivModContext ctx) {
        Integer num0 = (Integer)visit(ctx.expr(0));
        Integer num1 = (Integer)visit(ctx.expr(1));
        Integer res = null;

        if (num0 != null && num1 != null) {
                switch(ctx.op.getText()) {
                        case "*":
                                res = num0 * num1;
                                break;
                        case "/":
                                if (num1 == 0) {
                                        System.out.println("Erro! Divisão por 0!");
                                        return 0;
                                }
                                res = num0 / num1;
                                break;
                        case "%":
                                res = num0 % num1;
                                break;
                        default:
                                System.out.println("Erro! Essa operação não é suportada!");
                                break;
                }
                System.out.println("Resultado > " +  res);
        }
        else {
                System.out.println("Erro! Os números inseridos são inválidos!");
        }

        return res;

   }
}
