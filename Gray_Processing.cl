
__kernel void graying(__global const uchar* restrict img_test_in, __global uchar* restrict img_test_out, const unsigned int ROWS, const unsigned int COLS, const unsigned int CHANNELS)
{
    #pragma unroll
    for(size_t i = 0 ; i<COLS * ROWS * CHANNELS ; i += 3)
    {
	img_test_out[i] =  (img_test_in[0 + i] * 76 + img_test_in[1 +i] * 150 + img_test_in[2 + i] * 30) >> 8;
	img_test_out[i + 1] =  (img_test_in[0 + i] * 76 + img_test_in[1 +i] * 150 + img_test_in[2 + i] * 30) >> 8;
	img_test_out[i + 2] =  (img_test_in[0 + i] * 76 + img_test_in[1 +i] * 150 + img_test_in[2 + i] * 30) >> 8;
    }
}


