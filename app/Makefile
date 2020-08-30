GOPATH := ${PWD}
export GOPATH

build: src/isubata/vendor
	go build -v isubata

vet:
	go vet ./src/isubata/...

# no .PHONY
src/isubata/vendor:
	go get -u github.com/golang/dep/cmd/dep
	cd src/isubata &&  $(GOPATH)/bin/dep esnreu
