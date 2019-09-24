FROM ubuntu:18.04 

RUN apt-get update && apt-get install -y  haskell-platform 
#git vim

 
RUN cabal update

# A path we work in
WORKDIR /build

# Add .cabal file
ADD ./lemonade.cabal ./lemonade.cabal


RUN  cabal install --only-dependencies -j4

# Add and Install Application Code
ADD . .

RUN cabal install

# Add installed cabal executables to PATH
ENV PATH dist/build/lemonade:$PATH

EXPOSE 8080

CMD ["lemonade"]




