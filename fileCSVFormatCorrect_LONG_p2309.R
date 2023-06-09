# Chen Rujie
# Scripts help to read trading order CSV files and save it again to correct
# the "" missing problems of the elements in the CSV files.
# -------------------------------------------------------------------------

# Generate the Data Frame to write into the trade ordering CSV files.
# --------------------------------------------------------------------------
# Setting Conditions Parameters.
# ------------------------------
tradeOrder.colnames <- c("合约","类型","状态","触发条件","买卖","开平","投保","预埋时间","报单价格","报单手数","合约名")
tradeOrder.cont <- c("p2309")
tradeOrder.type <- c("条件单(本地)")
tradeOrder.mode <- c("已启动")
tradeOrder.condi.pre <- c("最新价")
tradeOrder.condi.ope <- c("≥")
tradeOrder.dir <- c("买")
tradeOrder.act <- c("开仓")
tradeOrder.pur <- c("投机")
tradeOrder.time <- c("08:55:00")
tradeOrder.price.start <- 7220
tradeOrder.price.end <- 12400
tradeOrder.price.int <- 30
tradeOrder.price.pos <- c("1")
tradeOrder.contname <- c("P2309")

# Generate conditions.
# --------------------
tradeOrder.price = seq(from = tradeOrder.price.start, 
		to = tradeOrder.price.end, 
		by = tradeOrder.price.int)

tradeOrder.condi <- paste(tradeOrder.condi.pre, 
		tradeOrder.condi.ope, 
		tradeOrder.price,
		sep = " ")

# Generate Data Frame.
# --------------------
tradeOrder.df <- data.frame(con = tradeOrder.cont, 
		type = tradeOrder.type,
		mode = tradeOrder.mode,
		condi = tradeOrder.condi,
		dir = tradeOrder.dir,
		act = tradeOrder.act,
		pur = tradeOrder.pur,
		time = tradeOrder.time,
		price = as.character(tradeOrder.price),
		pos = tradeOrder.price.pos,
		contname = tradeOrder.contname)
colnames(tradeOrder.df) <- tradeOrder.colnames

# Saving to CSV file.
filePath <- getwd()
fileToSaveFileName <- "p2309_LONG_1.csv"
fileToSave <- file.path(filePath, fileToSaveFileName)
write.csv(tradeOrder.df, file = fileToSave, quote = TRUE)