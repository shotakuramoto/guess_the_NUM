%This script will test the use of while statement

clc;
clear all;

answerrow = 5;
answercol = 5;

%Practicing the use of the random value
for i = 1:50
randomvalue1 = floor(randi(10));

disp(randomvalue1);
end

%See the guess is correct or not
playercorrect = false;

while ~ playercorrect
    
    %Gain input from the user
    inputrow1 = input('Enter a row:');
    inputcol1 = input('Enter a col:');
    
    %When the gained input was equal to the answer, display correct and end
    %the while loop
    if answerrow == inputrow1 && answercol == inputcol1
        fprintf("Correct. The answer row is %d and the answer column is %d.", answerrow, answercol);
        playercorrect = true;
    end
end

%Test the use of outer and inner while statement
%and outer and inner if statement

answerrow2 = 5;
answercol2 = 5;

playercorrect1 = false;
playercorrect2 = false;

%Check the use of while statemenet to give feedback based on the previous
%guess. (NO feedback for the first guess. Feedback will be given from second guess.)
while ~ playercorrect1
    
    %Gain input from the user
    inputrow2 = input('Enter a row (outer):');
    inputcol2 = input('Enter a col (outer):');
    
    %When the gained input was equal to the answer, display correct and end
    %the while loop
    if answerrow2 == inputrow2 && answercol2 == inputcol2
        disp('correct(outer)');
        playercorrect1 = true;
        
    else
        while ~ playercorrect2
            
            inputrow3 = input('Enter a row (inner):');
            inputcol3 = input('Enter a col (inner):');
            
            if answerrow2 == inputrow3 && answercol2== inputcol3
                %Check the second attempt is correct or not.
                %If it is not correct, run the inner while statement again
                disp('correct(inner)');
                playercorrect2 = true;
                playercorrect1 = true;
            
                %end of the inner if statement
            end
            
        %end of the inner while statement    
        end
        
    %end of the outer if statement
    end
    
%End of the outer while statement
end


   %Examples of conditional execution to see weather the guess is correct
   %to the answer or not.
   %When the player made same 'row' guess from previous guess    
            %elseif guessrow2 == preguessrow && guesscol2 == targetcol
                %disp('Guessed row is same from the previous one, but the column is correct');
                %preguessrow = guessrow2;
                %preguesscol = guesscol2;
                
            %elseif guessrow2 == preguessrow && abs(guesscol2 - targetcol) < abs(preguesscol - targetcol)
                %disp('Guessed row is same from the previous one, and the column is getting close');
                %preguessrow = guessrow2;
                %preguesscol = guesscol2;
                
            %elseif guessrow2 == preguessrow && abs(guesscol2 - targetcol) > abs(preguesscol - targetcol)
                %disp('Guessed row is same from the previous one, and the column is further away');
               % preguessrow = guessrow2;
                %preguesscol = guesscol2;
                
            %elseif guessrow2 == preguessrow && abs(guesscol2 - targetcol) == abs(preguesscol - targetcol)
                %disp('Guessed row is same from the previous one, and the distance to the answer column is same from the previous guessed column');
                %preguessrow = guessrow2;
                %preguesscol = guesscol2;
                
                
            %when the player made same 'column' guess from the previous one    
            %elseif guesscol2 == preguesscol && guessrow2 == targetrow
                %disp('Guessed column is same from the previous one, but the row is correct');
                %preguessrow = guessrow2;
                %preguesscol = guesscol2;
                
            %elseif guesscol2 == preguesscol && abs(guessrow2 - targetrow) < abs(preguessrow - targetrow)
                %disp('Guessed column is same from the previous one, and the row is getting close');
                %preguessrow = guessrow2;
                %preguesscol = guesscol2;
                
            %elseif guesscol2 == preguesscol && abs(guessrow2 - targetrow) > abs(preguessrow - targetrow)
                %disp('Guessed column is same from the previous one, and the row is further away');
                %preguessrow = guessrow2;
                %preguesscol = guesscol2;  
                
            %elseif guesscol2 == preguesscol && abs(guessrow2 - targetrow) == abs(preguessrow - targetrow)
                %disp('Guessed column is same from the previous one, and the distance to the answer row is same from the previous guessed row');
                %preguessrow = guessrow2;
                %preguesscol = guesscol2;
