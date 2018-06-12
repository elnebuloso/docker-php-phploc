#/bin/bash

case "$1" in
    create)
        docker build -t docker-php-phploc --rm --pull -f Dockerfile .
    ;;

    verify)
        docker run -it --rm docker-php-phploc --version
    ;;

    help)
        docker run -it --rm docker-php-phploc --help
    ;;

    test)
        rm -rf test/report
        mkdir -p test/report
        git clone https://github.com/symfony/asset.git test/symfony-asset > /dev/null 2>&1

        docker run --rm -w $(pwd) -v $(pwd):$(pwd) docker-php-phploc \
            --log-csv=$(pwd)/test/report/report.csv \
            --log-xml=$(pwd)/test/report/report.xml \
            $(pwd)/test/symfony-asset/
    ;;

    *)
        echo " - create  create container"
        echo " - verify  verify container"
        echo " - help    help container"
        echo " - test    collect metrics from test"
    ;;
esac