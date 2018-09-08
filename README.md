# dependencies
```sh
go get -u github.com/intel-go/cpuid
go get -u github.com/minio/asm2plan9s
go get -u github.com/klauspost/asmfmt/cmd/asmfmt
go get -u github.com/minio/c2goasm
```

# regenerate asm
```sh
go generate
```

# target
use sse4/avx/avx2/avx512 intel instructions to speed arithmetical operation and logic operation<br>
with vector params, and hash etc.     
now just support 17 funcs, some extra will be added later    

# bench mark
```sh
BenchmarkGoSum-4                 	 3000000	       556 ns/op     
BenchmarkAsmSum-4                	20000000	        57.3 ns/op     
BenchmarkGoMax-4                 	 2000000	       787 ns/op     
BenchmarkAsmMax-4                	10000000	       151 ns/op     
BenchmarkGoMin-4                 	 2000000	       765 ns/op     
BenchmarkAsmMin-4                	10000000	       147 ns/op     
BenchmarkGoAnd-4                 	 2000000	       812 ns/op     
BenchmarkAsmAnd-4                	10000000	       143 ns/op     
BenchmarkGoAnd2-4                	 1000000	      1249 ns/op     
BenchmarkGoAnd2_1-4              	 1000000	      1390 ns/op     
BenchmarkAsmAnd2-4               	10000000	       149 ns/op     
BenchmarkGoAnd4-4                	  500000	      2442 ns/op     
BenchmarkGoAnd4_1-4              	  500000	      2877 ns/op     
BenchmarkAsmAnd4-4               	 5000000	       387 ns/op     
BenchmarkGoOr-4                  	 2000000	       696 ns/op     
BenchmarkAsmOr-4                 	20000000	       110 ns/op     
BenchmarkGoOr2-4                 	 1000000	      1212 ns/op     
BenchmarkGoOr2_1-4               	 1000000	      1449 ns/op     
BenchmarkAsmOr2-4                	10000000	       147 ns/op     
BenchmarkGoOr4-4                 	  500000	      2637 ns/op     
BenchmarkGoOr4_1-4               	  500000	      3199 ns/op     
BenchmarkAsmOr4-4                	 3000000	       592 ns/op     
BenchmarkGoAndn-4                	 1000000	      1037 ns/op     
BenchmarkAsmAndn-4               	10000000	       147 ns/op     
BenchmarkGoMulti-4               	 2000000	       840 ns/op     
BenchmarkAsmMulti-4              	 1000000	      1008 ns/op     
BenchmarkGoMemcopy-4             	50000000	        33.8 ns/op
BenchmarkAsmMemcopy-4            	50000000	        20.0 ns/op
BenchmarkGoMemset-4              	20000000	       111 ns/op     
BenchmarkGoMemset1-4             	 1000000	      1166 ns/op     
BenchmarkAsmMemset-4             	50000000	        22.9 ns/op     
BenchmarkGoBitmapGetBitNum-4     	 1000000	      1369 ns/op     
BenchmarkAsmBitmapGetBitNum-4    	 5000000	       342 ns/op     
BenchmarkGoBitmapGetBitList-4          30000         52366 ns/op
BenchmarkAsmBitmapGetBitList-4         30000         46385 ns/op
BenchmarkGoBkdrHash-4            	20000000	        68.5 ns/op     
BenchmarkAsmBkdrHash-4           	20000000	        68.5 ns/op     
BenchmarkGoStringAdSum-4         	30000000	        62.0 ns/op     
BenchmarkAsmStringAdSum-4        	50000000	        30.9 ns/op     
```
