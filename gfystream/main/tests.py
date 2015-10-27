from django.test import TestCase

# Create your tests here.

class MainPageTest(TestCase):
	def test_returns_appropriate_html(self):
		index = self.client.get('/')
		self.assertEquals(index.status_code, 200)