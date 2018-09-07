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
use sse4/avx/avx2/avx512 intel instructions to speed arithmetical operation and logic operation
with vector params, and hash etc.
now just support 17 funcs, some extra will be added later