 int NP = 14;

 void ask(){
     int d = 0;
     while (d == 0) { 
     puts("Enter Ctrl+C To Exit: ");
     scanf("%d", d);
     if(d != 0){
         if( d > 4){
             if(d < NP){
                 printf("%d is just right!", &d);
                 return;
             }else{
                 puts("Whoops! That's too big. Please enter a smaller number!");
             }
         }else{
             puts("Whoops! That's too small. Please enter a higher number!");
         }
     }
      if(d == 0){
     puts("Sorry, did not understand your input. Repeating question.");
      }
     }
 
 }
