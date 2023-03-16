@SuppressWarnings("CheckReturnValue")
public class Execute extends SuffixCalculatorBaseVisitor<Double> {

   @Override public Double visitProgram(SuffixCalculatorParser.ProgramContext ctx) {
      Double res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public Double visitStat(SuffixCalculatorParser.StatContext ctx) {
      Double res = null;
      return visitChildren(ctx);
      //return res;
   }

   @Override public Double visitExprNumber(SuffixCalculatorParser.ExprNumberContext ctx) {
      return Double.parseDouble(ctx.Number().getText());
      //return res;
   }

   @Override public Double visitExprSuffix(SuffixCalculatorParser.ExprSuffixContext ctx) {
     
	Double num0 = (Double)visit(ctx.expr(0));
 	Double num1 = (Double)visit(ctx.expr(1));
 	Double res = null;
	
	if (num0 != null && num1 != null) {	
		switch(ctx.op.getText()) {
                	case "*":
                        	res = num0 * num1;
                        	break;
                	case "/":
				if (num1 == 0) {
					System.out.println("Erro! Divisão por 0!");
					return 0.0;
				}
                        	res = num0 / num1;
                        	break;
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
}
