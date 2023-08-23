import discord
from discord.ext import commands
from pyfiglet import figlet_format
from termcolor import colored
from dotenv import load_dotenv
import os

# Load environment variables from .env file
load_dotenv()

intents = discord.Intents.default()
bot = commands.Bot(command_prefix='!', intents=intents)

@bot.event
async def on_ready():
    # Generate ASCII art
    ascii_art = figlet_format("Discord bot Is Online")
    # Print it in color
    print(colored(ascii_art, 'blue'))

@bot.command()
async def botinfo(ctx):
    await ctx.send('Bot Is Made By Eveeify')

# Read the token from an environment variable
token = os.getenv('DISCORD_TOKEN')

bot.run(token)