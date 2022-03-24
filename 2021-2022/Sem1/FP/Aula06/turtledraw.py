# Exercise 5 on "How to think like a computer scientist", ch. 11.

from tkinter import filedialog
import turtle

t = turtle.Turtle()

# Use t.up(), t.down() and t.goto(x, y)

# Put your code here

name = filedialog.askopenfilename(title="Choose File")


# For every line in the file

for line in open(name, "r", encoding="utf-8"):

    # Every line with coordinates's second character is a number

    if line[1].isdigit():
                
        x = line.strip().split()
       
        print(x)

        t.goto(float(x[0]), float(x[1]))



    # If the second character isn't a number then the line is either UP or DOWN
    
    else:    
        if line[0] == "U":
            print("UP")
            t.up()

        else:
            print("DOWN")
            t.down()


# wait
turtle.Screen().exitonclick()

