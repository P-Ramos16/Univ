@SuppressWarnings("CheckReturnValue")
public class Execute extends HelloBaseVisitor<String> {

   @Override public String visitCommand(HelloParser.CommandContext ctx) {
      String res = null;
      System.out.println("Aqui! ID");
      return visitChildren(ctx);
      //return res;
   }

   @Override public String visitGreetings(HelloParser.GreetingsContext ctx) {
      String res = null;
      System.out.println("Boas! ID > " + ctx.ID());
      return visitChildren(ctx);
      //return res;
   }

   @Override public String visitBye(HelloParser.ByeContext ctx) {
      String res = null;
      System.out.println("Adeus! ID > " + ctx.ID());
      return visitChildren(ctx);
      //return res;
   }

}
