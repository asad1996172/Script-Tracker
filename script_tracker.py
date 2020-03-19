import firebase_admin
import requests
from firebase_admin import credentials, firestore
import datetime
import sys


class ScriptTracker:
    def __init__(self):
        self.starting_time = datetime.datetime.now()
        self.email = ''
        self.password = ''

        self._verify_password_url = 'https://www.googleapis.com/identitytoolkit/v3/relyingparty/verifyPassword'
        self.api_key = "AIzaSyAclqlFVOFaxoZ9KKVVxSOqPImc9Kp4RjE"

        self.script_name = ''
        self.total_done = 0
        self.total_crashed = 0
        self.unique_crash_logs = []

        self.uid = ''

        self.cred = credentials.Certificate("live-scraping-firebase-adminsdk-gck9g-011e4f00e1.json")
        self.firebase = firebase_admin.initialize_app(self.cred)
        self.db = firestore.client()
        self.users_ref = self.db.collection(u'scrappers')

        self.docs = None
        self.current_scrappers_data = None
        self.status = 'Running'

    def set_status_to_completed(self):
        self.status = 'Completed'
        self.docs = self.users_ref.stream()
        for doc in self.docs:
            if doc.id == self.uid:
                self.current_scrappers_data = doc.to_dict()

        self.current_scrappers_data[self.script_name]['status'] = self.status
        self.users_ref.document(self.uid).set(self.current_scrappers_data)

    def set_status_to_crashed(self):
        self.status = 'Crashed'
        self.docs = self.users_ref.stream()
        for doc in self.docs:
            if doc.id == self.uid:
                self.current_scrappers_data = doc.to_dict()

        self.current_scrappers_data[self.script_name]['status'] = self.status
        self.users_ref.document(self.uid).set(self.current_scrappers_data)

    def initialize(self, inp_email, inp_password, script_name):
        self.email = inp_email
        self.password = inp_password
        self.script_name = script_name

        body = {'email': self.email, 'password': self.password}
        params = {'key': self.api_key}
        try:
            resp = requests.request('post', self._verify_password_url, params=params, json=body)
            resp.raise_for_status()
            self.uid = resp.json().get('localId')
            print('Logged In Successfully !!')

            self.docs = self.users_ref.stream()
            for doc in self.docs:
                if doc.id == self.uid:
                    self.current_scrappers_data = doc.to_dict()

        except Exception as e:
            print('Could not Log In, Please make sure that you have created an account on Mobile Application ')
            sys.exit()

    def send_data(self, total_done, total_crashed, unique_crash_logs):
        time_now = datetime.datetime.now()
        time_elapsed = time_now - self.starting_time
        total_seconds = time_elapsed.total_seconds()
        hours = int(divmod(total_seconds, 3600)[0])
        minutes = int(divmod(total_seconds, 60)[0])
        time_elapsed = str(hours) + ':' + str(minutes)

        new_scrapper_data = {
            'time_elapsed': time_elapsed,
            'records_crashed': total_crashed,
            'records_scraped': total_done,
            'script_name': self.script_name,
            'status': self.status,
            'unique_crash_logs': list(set(unique_crash_logs))
        }

        self.current_scrappers_data[self.script_name] = new_scrapper_data
        self.users_ref.document(self.uid).set(self.current_scrappers_data)
