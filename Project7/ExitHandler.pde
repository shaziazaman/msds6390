protected void prepareOnExitHandler() {
Runtime.getRuntime().addShutdownHook(new Thread(new Runnable() {
   
   public void run () {
     System.out.println("SHUTDOWN HOOK");
     weatherClient.stop();
   }
 }
 ));
}