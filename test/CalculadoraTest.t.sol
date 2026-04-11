//SPDX-License-Identifier: MIT

pragma solidity ^0.8.34;

import "forge-std/Test.sol";
import "../src/Calculadora.sol";

contract CalculadoraTest is Test {

	Calculadora calculadora;
	uint256 public firstResultado = 100;
	address public admin = vm.addr(1);

	function setUp() public {
		calculadora = new Calculadora(firstResultado, admin);
	}

	//Unit testing 
	//El test unitario de toda la vida 
	function testCheckFirstResult() public view{
		uint256 firstResultado_ = calculadora.resultado();
		firstResultado_ == firstResultado;

	}

	function testAddition() public {
		uint256 firstNumber_ = 10;
		uint256 secondNumber_ = 20;
		uint256 resultado_ = calculadora.addition(firstNumber_, secondNumber_);
		assert(resultado_ == firstNumber_ + secondNumber_);
	}

	function testSubstraction() public {
		uint256 firstNumber_ = 10;
		uint256 secondNumber_ = 20;
		uint256 resultado_ = calculadora.substraction(firstNumber_, secondNumber_);
		assert(resultado_ == firstNumber_ - secondNumber_);
	}

	function testMultiplication() public {
		uint256 firstNumber_ = 10;
		uint256 secondNumber_ = 20;
		uint256 resultado_ = calculadora.multiplication(firstNumber_, secondNumber_);
		assert(resultado_ == firstNumber_ * secondNumber_);
	}

	function testDivision() public {
		uint256 firstNumber_ = 10;
		uint256 secondNumber_ = 20;
		uint256 resultado_ = calculadora.division(firstNumber_, secondNumber_);
		assert(resultado_ == firstNumber_ / secondNumber_);
	}


	function testCanNotMultiply2LargeNumbers() public {
		uint256 firstNumber_ = 5;
		uint256 secondNumber_  = 11232131231231231232131232142141241241242121541254214512312;

		vm.expectRevert();

		calculadora.multiplication(firstNumber_, secondNumber_);

	}

	//Fuzzing testing 


	
}