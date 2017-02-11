# coding=utf-8

from flask import render_template, flash, redirect, session, url_for, request, g, Markup
from web_engine import app
import sys

@app.route('/')
@app.route('/index')
def index():
    return render_template('index.html')

@app.route('/about')
def about():
    return render_template('about.html', v = ' ()-- ' + str(sys.version_info))





