# author: nate alberti
# date: 03-11-2021
# purpose: utilizes the utils.asm file and a subprogram I coded to add two numbers and display the sum

.data
	welcome_message: .asciiz "Welcome to Calculator"
	prompt_int_1: .asciiz "please enter an integer: "
	prompt_int_2: .asciiz "please enter another integer: "
	result: .asciiz "your sum: "
	
.text
main:
	# calling PromptInt to get the first number
	la $a0, prompt_int_1 # loading the prompt into arguement reg
	jal PromptInt # running the PromptInt subprogram from utils.asm
	move $t0, $v0  # moving the return value from PromptInt to $t0
	
	# calling PromptInt to get the second number
	la $a0, prompt_int_2 # loading the prompt into arguement reg
	jal PromptInt # running the PromptInt subprogram from utils.asm
	move $t1, $v0  # moving the return value from PromptInt to $t1
	
	# calling AddTwo to add the two numbers
	move $a0, $t0 # moving the first number into argument reg
	move $a1, $t1 # moving the second number into argument reg 2
	jal AddTwo # running the add two subprogram on the two numbers
	
	# calling PrintInt to print the result
	move $a1, $v0 # moving the return value of AddTwo to $a1 in preparation for PrintInt
	la $a0, result # moving result string to $a0 in preparation for PrintInt
	jal PrintInt # printing the result
	jal PrintNewLine # printing a new line
	jal Exit # exiting the program
	

.include "utils.asm"
.include "AddTwoSubprogram.asm"
	
	