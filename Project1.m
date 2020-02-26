%clear all
clc;
clear all;

%This script is the game where the user tries to guess a number 2D location in an imaginary 3*3 grid  
%based on feedback from the the computer in terms of 
%information like “you’re getting closer” or “you’re getting further away”.
%This program uses LOOP and CONDITIONAL EXECUTION

%TEST CASES - Possible combination of output
%1st test: the answer row is 5 and the answer col is 5
%1st guess: row 1 col 1		test: Have a guess again
%2nd guess: row 5 col 3		test: Your guessed row is correct and column is getting close
%3rd guess: row 5 col 2		test: Guessed row is same from previous one, and column is further away
%4th guess: row 5 col 2		test: it is the same guess from prvious one.
%TEST COMPLETED: ALL CORRECT

%2nd test: answer row is 3 answer col is 3
%1st guess: row 5 col 5		output: Have a guess again
%2nd guess: row 1 col 4		output: Your guessed column is getting close. The distance to the answer row is same from the previous guessed row.
%3rd guess: row 5 col 1		output: Your guessed column is further away, but the distance to the answer row is same from the previous guessed row.
%4th guess: row 2 col 2		output: Your guessed row and column is getting close
%5th guess: row 5 col 5		output: Your guessed row and column is further away
%TEST COMPLETED: ALL CORRECT

%3rd test: answer row is 3 answer col is 3
%1st guess: row 1 col 1		output: Have a guess again
%2nd guess: row 1 col 1		output: It is the same guess from the previous one
%3rd guess: row 5 col 5		output: The distance to the answer column and the answer row hasn't change from the previous guess
%4th guess: row 5 col 4		output: Guessed row is same from the previous one, and the column is getting close.
%5th guess: row 5 col 5		output: Gussed row is same from the previous one, and the column is further away.
%6th guess: row 1 col 1		output: The distance to the answer column and the answer row hasn't change from the previous guess
%6th guess: row 5 col 3		output: Your guessed column is correct. But the distance to the answer column did not change from previous guess.
%TEST COMPLETED: ALL CORRECT

%Next
%1st guess: row 1 col 1		output: Have a guess again
%2nd guess: row 3 col 3		output: Correct
%3rd guess: row 6 col 2		output: YOU LOSE
%5th guess: row -4 col 4		output: YOU LOSE

%Explain the description of the game to the player
disp("You will guess column and number from the 5*5 grid.");
disp("Everytime when you make a guess, you will receive a feedback based on previous guess.");
disp("Therefore, there won't be any feedback on first guess")
disp("Use the feedback as a reference and lead to the answer row and column.");
disp("You will immediate lose when you type larger number than 5 or smaller number than 1.");

%Code to define the target 2D array
%random is used to make sure the answer will differ everytime when the
%player plays this game.
targetrow = 5;
targetcol = 5;

%Use the while loop when the input of the player is wrong
%End loop when the player got the target row and col
playercorrect = false;
playercorrect2 = false;

while ~ playercorrect;
    
    %This section will gain the input from the player
    %This outer if statment will only used for the first guess.
    %Because first guess will not give any feedback to the user
    guessrow = input('Enter your guessed row:');
    guesscol = input('Enter your guessed column:');
    
    preguessrow = guessrow;
    preguesscol = guesscol;
    
    if guessrow == targetrow && guesscol == targetcol
        %Check whether the first guess of col or row is correct or not
        fprintf("Corrent. The answer row is %d and the answer column is %d.\n", targetrow, targetcol);
        playercorrect = true;
        
    elseif guessrow > 5 || guesscol > 5 || guessrow < 1 || guesscol < 1
        %Output lose and immediatley end the program when the player types
        %in the number lower than 1 or larger than 3.
        disp('YOU LOSE');
        playercorrect = true;
        playercorrect2 = true;
        
    else
        disp('No feedback for the first guess. Have a guess again.');
        %If the first guess was not correct, program will run the following
        %code until the user gets the correct answer
        
        while ~ playercorrect2
            guessrow2 = input('Enter your guessed row:');
            guesscol2 = input('Enter your guessed col:');
            
            %Correct or lose
             if guessrow2 == targetrow && guesscol2 == targetcol
             fprintf("Correct. The asnwer row is %d and the answer column is %d.\n", targetrow, targetcol);
             playercorrect2 = true;
             playercorrect = true;
             
             elseif guessrow2 > 5 || guesscol2 > 5 || guessrow2 < 1 || guesscol2 < 1
                disp('YOU LOSE');
                playercorrect2 = true;
                playercorrect = true;
                
                if guessrow2 == preguessrow && guesscol2 == preguesscol
                        disp('It is same guess from the previous one');
                        preguessrow = guessrow2;
                        preguesscol = guesscol2;
                
                elseif abs(guessrow2 - targetrow) == abs(preguessrow - targetrow) && abs(guesscol2 - targetcol) == abs(preguesscol - targetcol)
                        disp("The distance to the answer column and the answer row hasn't change from the previous guess");
                        preguessrow = guessrow2;
                        preguesscol = guesscol2;  
                
                elseif guessrow2 == preguessrow || guesscol2 == preguesscol
                
                    if guessrow2 == preguessrow && guesscol2 == targetcol
                        disp('Guessed row is same from the previous one, but the column is correct');
                        preguessrow = guessrow2;
                        preguesscol = guesscol2;

                    elseif guessrow2 == preguessrow && abs(guesscol2 - targetcol) < abs(preguesscol - targetcol)
                        disp('Guessed row is same from the previous one, and the column is getting close');
                        preguessrow = guessrow2;
                        preguesscol = guesscol2;

                    elseif guessrow2 == preguessrow && abs(guesscol2 - targetcol) > abs(preguesscol - targetcol)
                        disp('Guessed row is same from the previous one, and the column is further away');
                        preguessrow = guessrow2;
                        preguesscol = guesscol2;

                    elseif guessrow2 == preguessrow && abs(guesscol2 - targetcol) == abs(preguesscol - targetcol)
                        disp('Guessed row is same from the previous one, and the distance to the answer column is same from the previous guessed column');
                        preguessrow = guessrow2;
                        preguesscol = guesscol2;

                
                    %when the player made same 'column' guess from the previous one    
                    elseif guesscol2 == preguesscol && guessrow2 == targetrow
                        disp('Guessed column is same from the previous one, but the row is correct');
                        preguessrow = guessrow2;
                        preguesscol = guesscol2;

                    elseif guesscol2 == preguesscol && abs(guessrow2 - targetrow) < abs(preguessrow - targetrow)
                        disp('Guessed column is same from the previous one, and the row is getting close');
                        preguessrow = guessrow2;
                        preguesscol = guesscol2;

                    elseif guesscol2 == preguesscol && abs(guessrow2 - targetrow) > abs(preguessrow - targetrow)
                        disp('Guessed column is same from the previous one, and the row is further away');
                        preguessrow = guessrow2;
                        preguesscol = guesscol2;  

                    elseif guesscol2 == preguesscol && abs(guessrow2 - targetrow) == abs(preguessrow - targetrow)
                        disp('Guessed column is same from the previous one, and the distance to the answer row is same from the previous guessed row');
                        preguessrow = guessrow2;
                        preguesscol = guesscol2;
                    
                    end
                
                elseif guessrow2 == targetrow || guesscol2 == targetcol
                    
                    if guessrow2 == targetrow && abs(guesscol2 - targetcol) < abs(preguesscol - targetcol)
                        disp('Your guessed row is correct and column is getting close');
                        %this program will give feedback to player based on the
                        %previous guess.
                        %Therefore, when player made wrong guess, it will stored
                        %into preguess variable.
                        %Then, this preguess variable will be used in the next
                        %conditonal execution.
                        preguessrow = guessrow2;
                        preguesscol = guesscol2;

                    elseif guessrow2 == targetrow && abs(guesscol2 - targetcol) > abs(preguesscol - targetcol)
                        disp('Your guessed row is correct and column is further away');
                        preguessrow = guessrow2;
                        preguesscol = guesscol2;           

                    elseif guessrow2 == targetrow && abs(guesscol2 - targetcol) == abs(preguesscol - targetcol)
                        disp('Your guessed row is correct. The distance to the answer column did not change from previous guess.');
                        preguessrow = guessrow2;
                        preguesscol = guesscol2;

                    %when the player got column correct    
                    elseif guesscol2 == targetcol && abs(guessrow2 - targetrow) < abs(preguessrow - targetrow)
                        disp('Your guessed column is correct and the row is getting close');
                        preguessrow = guessrow2;
                        preguesscol = guesscol2;

                    elseif guesscol2 == targetcol && abs(guessrow2 - targetrow) > abs(preguessrow - targetrow)
                        disp('Your guessed column is correct and the row is further away');
                        preguessrow = guessrow2;
                        preguesscol = guesscol2;

                    elseif guesscol2 == targetcol && abs(guessrow2 - targetrow) == abs(preguessrow - targetrow)
                        disp('Your guessed column is correct. The distance to the answer column did not change from previous guess.');
                        preguessrow = guessrow2;
                        preguesscol = guesscol2;
                    end
                    
             else
                    if abs(guessrow2 - targetrow) < abs(preguessrow - targetrow) && abs(guesscol2 - targetcol) < abs(preguesscol - targetcol)
                        disp('Your guessed row and column is getting close');
                        preguessrow = guessrow2;
                        preguesscol = guesscol2;

                    elseif abs(guessrow2 - targetrow) > abs(preguessrow - targetrow) && abs(guesscol2 - targetcol) < abs(preguesscol - targetcol)
                        disp('Your guessed column is getting close, but row is further away');
                        preguessrow = guessrow2;
                        preguesscol = guesscol2;

                    elseif abs(guessrow2 - targetrow) == abs(preguessrow - targetrow) && abs(guesscol2 - targetcol) < abs(preguesscol - targetcol)
                        disp('Your guessed column is getting close. The distance to the answer row is same from the previous guessed row.');
                        preguessrow = guessrow2;
                        preguesscol = guesscol2;

                    elseif abs(guessrow2 - targetrow) == abs(preguessrow - targetrow) && abs(guesscol2 - targetcol) > abs(preguesscol - targetcol)
                        disp('Your guessed column is further away, but the distance to the answer row is same from the previous guessed row.');
                        preguessrow = guessrow2;
                        preguesscol = guesscol2;



                    elseif abs(guessrow2 - targetrow) < abs(preguessrow - targetrow) && abs(guesscol2 - targetcol) > abs(preguesscol - targetcol)
                        disp('Your guessed row is getting close, but column is further away');
                        preguessrow = guessrow2;
                        preguesscol = guesscol2;

                    elseif abs(guessrow2 - targetrow) < abs(preguessrow - targetrow) && abs(guesscol2 - targetcol) == abs(preguesscol - targetcol)
                        disp('Your guessed row is getting close. The distance to the answer column is same from the previous guessed column');
                        preguessrow = guessrow2;
                        preguesscol = guesscol2;

                    elseif abs(guessrow2 - targetrow) > abs(preguessrow - targetrow) && abs(guesscol2 - targetcol) == abs(preguesscol - targetcol)
                        disp('Your guessed row is further away. The distance to the answer column is same from the previous guessed column.');
                        preguessrow = guessrow2;
                        preguesscol = guesscol2;


                    elseif abs(guessrow2 - targetrow) > (preguessrow - targetrow) && abs(guesscol2 - targetcol) > abs(preguesscol - targetcol)
                        disp('Your guessed row and column is further away');
                        preguessrow = guessrow2;
                        preguesscol = guesscol2;
                    end
                end
             end
        end
    end
end

