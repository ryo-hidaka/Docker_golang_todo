FROM golang:latest
RUN GOPATH=/go
WORKDIR /go/src/github.com/ryo.hidaka/compose


# ソースをコピーする
ADD . .

RUN go get -u github.com/gin-gonic/gin; 
RUN go get -u -t github.com/volatiletech/sqlboiler; 
RUN go get github.com/volatiletech/sqlboiler/drivers/sqlboiler-mysql;
RUN go get -u github.com/go-sql-driver/mysql; 
 
#RUN sqlboiler mysql
#RUN sqlboiler mysql -t form --wipe --add-global-variants;
#RUN go mod init
#RUN go build
#RUN go install github.com/ryo.hidaka/compose/;

RUN go install /go/src/github.com/ryo.hidaka/compose
# Linux用バイナリファイルをgo build して取得
RUN  GOOS=linux GOARCH=amd64 go build hello.go

# ポートの指定
EXPOSE 8080 
#バイナリファイルの実行
CMD [ "golang_todo" ]
