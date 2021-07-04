import cocotb
from cocotb.triggers import Timer
import random

def multiply_model(a: int, b: int) -> int:
    return a * b

@cocotb.test()
async def mutliply_randomised_test(dut):
    for i in range(10):

        A = random.randint(0, 15)
        B = random.randint(0, 15)

        dut.A <= A
        dut.B <= B

        await Timer(2, units='ns')

        assert dut.X.value.value == multiply_model(A, B), "Randomised test failed with: {A} * {B} = {X}".format(
            A=dut.A.value, B=dut.B.value, X=dut.X.value)

