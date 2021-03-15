# File: utils.asm
# Purpose: To define utilities which will be used in MIPS programs.
# Author: Charles Kann
#
# Instructors are granted permission to make copies of this file
# for use by # students in their courses. Title to and ownership
# of all intellectual property rights
# in this file are the exclusive property of
# Charles W. Kann, Gettysburg, Pa.
#
# Subprograms Index:
# Exit - Call syscall with a server 10 to exit the program
# NewLine - Print a new line character (\n) to the console
# PrintInt - Print a string with an integer to the console
# PrintString - Print a string to the console
# PromptInt - Prompt the user to enter an integer, and return
# it to the calling program.
#
# Modification History
# 12/27/2014 - Initial release
# subprogram: PrintNewLine
# author: Charles Kann
# purpose: to output a new line to the user console
# input: None
# output: None
# side effects: A new line character is printed to the
# user's console
.text
PrintNewLine:
	li $v0, 4
	la $a0, __PNL_newline
	syscall
	jr $ra
.data
	__PNL_newline: .asciiz "\n"
	
# subprogram: PrintInt
# author: Charles W. Kann
# purpose: To print a string to the console
# input: $a0 - The address of the string to print.
# $a1 - The value of the int to print
# returns: None
# side effects: The String is printed followed by the integer value.
.text
PrintInt:
	# Print string. The string address is already in $a0
	li $v0, 4
	syscall
	# Print integer. The integer value is in $a1, and must
	# be first moved to $a0.
	move $a0, $a1
	li $v0, 1
	syscall
	#return
	jr $ra
	
# subprogram: PromptInt
# author: Charles W. Kann
# purpose: To print the user for an integer input, and
# to return that input value to the caller.
# input: $a0 - The address of the string to print.
# returns: $v0 - The value the user entered
# side effects: The String is printed followed by the integer value.
.text
PromptInt:
	# Print the prompt, which is already in $a0
	li $v0, 4
	syscall
	# Read the integer value. Note that at the end of the
	# syscall the value is already in $v0, so there is no
	# need to move it anywhere.
	move $a0, $a1
	li $v0, 5
	syscall
	#return
	jr $ra

# subprogram: PrintString
# author: Charles W. Kann
# purpose: To print a string to the console
# input: $a0 - The address of the string to print.
# returns: None
# side effects: The String is printed to the console.
.text
PrintString:
	addi $v0, $zero, 4
	syscall
	jr $ra
	
# subprogram: Exit
# author: Charles Kann
# purpose: to use syscall service 10 to exit a program
# input: None
# output: None
# side effects: The program is exited
.text
Exit:
	li $v0, 10
	syscall