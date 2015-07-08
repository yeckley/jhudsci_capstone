blogTxt <- readLines('./data/final/en_US/en_US.blogs.txt')
blogs <- Corpus(VectorSource(blogTxt), readerControl = list(reader = readPlain, language= 'en'))
blogs <- tm_map(blogs, content_transformer(tolower), mc.cores = 1)
blogs <- tm_map(blogs, content_transformer(removePunctuation), mc.cores = 1)
blogs <- tm_map(blogs, content_transformer(removeNumbers), mc.cores = 1)
blogs <- tm_map(blogs, content_transformer(stripWhitespace), mc.cores = 1)
blogs <- tm_map(blogs, stemDocument, mc.cores = 1)
# Need to have a function that transforms input conforming to any
# transformations made to the original.
conditionInput <- function(s) {
    s <- tolower(s)
    s <- removePunctuation(s)
    s <- removeNumbers(s)
    s <- stripWhitespace(s)
    s <- stemDocument(s)
    s
}
