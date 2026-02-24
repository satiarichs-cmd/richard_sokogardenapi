from flask import *
import pymysql
import os
 
app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = 'static/images'

@app.route("/api/signup", methods = ["POST"])
def signup():
    # code to execute
    username = request.form['username']
    email = request.form['email']
    phone = request.form['phone']
    password = request.form['password']

    print(username, email, phone, password)
    # create db connection
    connection = pymysql.connect(host="localhost", user="root", password="", database="richard_sokogarden")
    
    # create cursor
    cursor = connection.cursor()
    # create sql query
    sql = "insert into users (username, email,phone,password) values (%s, %s, %s, %s)"
    data = (username, email, phone, password)
    # execute the query
    cursor.execute(sql, data)
    # save data
    connection.commit()
    # retrnresponse
    return jsonify({"message": "sign up api"})

@app.route("/api/signin", methods=["POST"])
def signin():
    email = request.form['email']
    password = request.form['password']
    print(email,password)

    connection = pymysql.connect(host="localhost", user="root", password="", database="richard_sokogarden")

    cursor=connection.cursor(pymysql.cursors.DictCursor)

    sql="select user_id, username, email, phone from users where email= %s and password= %s"
    data = (email,password)

    cursor.execute(sql,data)

    if cursor.rowcount == 0: 
        return jsonify({"message": "invalid cridential"})
    else:
     user = cursor.fetchone()
     return jsonify ({"message": "login successful", "user": user})


@app.route("/api/add_product", methods=["POST"])
def addproduct():
   product_name = request.form["product_name"]
   product_description =request.form["product_description"]
   product_category = request.form["product_category"]
   product_cost = request.form["product_cost"]
   product_image = request.files["product_image"]
   
   print(product_name,product_description,product_category,product_cost,product_image)

   image_name = product_image.filename
   print(image_name)


   file_path = os.path.join(app.config["UPLOAD_FOLDER"], image_name)

   print(file_path)

   product_image.save(file_path)

   connection = pymysql.connect(host="localhost", user="root", password="", database="richard_sokogarden")

   cursor=connection.cursor()  

   sql="insert into product_details (product_name, product_description, product_category, product_cost, product_image) values (%s, %s, %s, %s,%s)"
   
   data =(product_name, product_description, product_category, product_cost, image_name )

   cursor.execute(sql,data)

   connection.commit()

   return jsonify({"message": "product added successful"})

@app.route("/api/get_product")
def get_product():
   connection=pymysql.connect(host="localhost", user="root", password="", database="richard_sokogarden")
   cursor = connection.cursor(pymysql.cursors.DictCursor)
   sql = "select * from product_details"
   cursor.execute(sql)
   if cursor.rowcount == 0:
      return jsonify({'message', "out of stock"})
   else:
      product = cursor.fetchall()
      return jsonify(product)

# Mpesa Payment Route/Endpoint 
import requests
import datetime
import base64
from requests.auth import HTTPBasicAuth

@app.route('/api/mpesa_payment', methods=['POST'])
def mpesa_payment():
    if request.method == 'POST':
        amount = request.form['amount']
        phone = request.form['phone']
        # GENERATING THE ACCESS TOKEN
        # create an account on safaricom daraja
        consumer_key = "GTWADFxIpUfDoNikNGqq1C3023evM6UH"
        consumer_secret = "amFbAoUByPV2rM5A"

        api_URL = "https://sandbox.safaricom.co.ke/oauth/v1/generate?grant_type=client_credentials"  # AUTH URL
        r = requests.get(api_URL, auth=HTTPBasicAuth(consumer_key, consumer_secret))

        data = r.json()
        access_token = "Bearer" + ' ' + data['access_token']

        #  GETTING THE PASSWORD
        timestamp = datetime.datetime.today().strftime('%Y%m%d%H%M%S')
        passkey = 'bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919'
        business_short_code = "174379"
        data = business_short_code + passkey + timestamp
        encoded = base64.b64encode(data.encode())
        password = encoded.decode('utf-8')

        # BODY OR PAYLOAD
        payload = {
            "BusinessShortCode": "174379",
            "Password": "{}".format(password),
            "Timestamp": "{}".format(timestamp),
            "TransactionType": "CustomerPayBillOnline",
            "Amount": "1",  # use 1 when testing
            "PartyA": phone,  # change to your number
            "PartyB": "174379",
            "PhoneNumber": phone,
            "CallBackURL": "https://modcom.co.ke/api/confirmation.php",
            "AccountReference": "account",
            "TransactionDesc": "account"
        }

        # POPULAING THE HTTP HEADER
        headers = {
            "Authorization": access_token,
            "Content-Type": "application/json"
        }

        url = "https://sandbox.safaricom.co.ke/mpesa/stkpush/v1/processrequest"  # C2B URL

        response = requests.post(url, json=payload, headers=headers)
        print(response.text)
        return jsonify({"message": "Please Complete Payment in Your Phone and we will deliver in minutes"})
    
  
   
 


if __name__ == "__main__":
    app.run(debug=True)