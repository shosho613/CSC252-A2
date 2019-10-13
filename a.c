 #include <stdio.h>

 int NP = 14;

 int ask(){
     int d = 0;
     int isRight = 0;
     puts("Press CTRL+C to exit.");
     while (isRight == 0) { 
     
     //puts("Enter a positive integer for key size: ");
     scanf("%d", &d);
         
         if( d > 4){
             if(d <= NP){
                 printf("%d is just right!\n", d);
                 isRight = 1;
                 return d;
             }else{
                 puts("Whoops! That's too big. Please enter a smaller number!");
             }
         }else{
             puts("Whoops! That's too small. Please enter a higher number!");
         }
     }

    puts("Sorry, did not understand your input. Repeating question.");
      
     
     
 
 }
