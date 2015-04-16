
#define ROWS 576
#define COLS 720
#define CHANNELS 3

__kernel void graying(__global const uchar* restrict img_test_in, __global uchar* restrict img_test_out)
{
    int count = 0; 
    uchar rows[3];
    while(count != ROWS * COLS * CHANNELS)
    {
		#pragma unroll
		for (int i = 0; i < 3; i++)
		{
			#pragma unroll
			for (int ii = 2; ii > 0; --ii)
			{
				rows[ii] = rows[ii - 1];
			}
			rows[0] =  img_test_in[count + i];
		}
		#pragma unroll
		for (int i = 0; i < 3; i++)
		{
			#pragma unroll
			for (int ii = 2; ii > 0; --ii)
			{
				img_test_out[count + ii] = img_test_out[count + ii - 1];
			}
			img_test_out[count] =  (rows[0] * 76 + rows[1] * 150 + rows[2] * 30)  >> 8;
		}
		count += 3;
    }
}


