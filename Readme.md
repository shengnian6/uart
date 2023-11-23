<div align = "center" style = "color:red"><span style="font-size:25px;">串口通信</span></div>

![](./wave.png)

#### <b>设计目标</b>
我们在串口调试助手中设置：波特率为9600；数据位为8位；没有奇偶校验位；停止位为2比特。我们需要读取每次的数据位的值，并把他们给8个led灯，控制他们的闪灭。

#### <b>设计思路</b>
1. 我们接收一个异步信号，所以需要通过打拍来同步时钟。
2. 用到计数器来控制标记我们的信号，这样可以更方便后面调用
3. 要注意何时开始计时，因为这一次我们不是从0ns开始计时，所以要设计一个flag信号，在flag高电平的时候开始计时。这也就需要用到边缘检测。
4. 最后就是通过读取信号的中间值（这样更稳定），来给我们的led灯赋值。

***
***

<div align = "center" style = "color:red"><span style="font-size:25px;">Uart</span></div>

#### <b>Design Goals</b>
We set in the serial port debugging assistant: the baud rate is 9600; the data bits are 8 bits; there is no parity bit; the stop bit is 2 bits. We need to read the value of each data bit and give them to 8 LED lights to control their flashing.

#### <b>Design ideas</b>
1. We receive an asynchronous signal, so we need to synchronize the clock by tapping.
2. Use a counter to control the signal that marks us, which will make it easier to call later.
3. Pay attention to when to start timing, because this time we do not start timing from 0ns, so we need to design a flag signal to start timing when the flag is high. This also requires the use of edge detection.
4. Finally, we assign a value to our LED light by reading the intermediate value of the signal (which is more stable).