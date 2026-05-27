import yfinance as yf
import sys

tickerSymbol = sys.argv[1]
ticker = yf.Ticker(tickerSymbol)
price = round(ticker.info['regularMarketPrice'], 2)

output = '$' + str(f"{price:.2f}")

print(output)
