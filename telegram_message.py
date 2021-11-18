#!/usr/bin/env python3
import os
import sys
import json
import requests
import pandas as pd
from datetime import date, timedelta
import argparse

# args = parser.parse_args()


def send_telegram_message(message,bot_token,chat_id):
    the_body = "https://api.telegram.org/bot" + str(bot_token) + "/sendMessage?chat_id=" + str(chat_id) + "&text=" + str(message)

    response = requests.get(the_body)

    return response.json()

def send_epias_intraday_report_update(bot_token,chat_id):
    the_message = "Intraday report for " + str(date.today() - timedelta(days=1)) + " can be found at https://berkorbay.github.io/intraday in a couple of minutes."
    send_telegram_message(message=the_message,bot_token=bot_token,chat_id=chat_id)


if __name__ == "__main__":

    parser = argparse.ArgumentParser(description='arguments at command line')
    parser.add_argument('--bottoken', default=None, type=str,help='Telegram bot token')
    parser.add_argument('--chatid', default=None, type=str,help='Telegram chat id')

    args = parser.parse_args()
    send_epias_intraday_report_update(bot_token=args.bottoken,chat_id=args.chatid)
