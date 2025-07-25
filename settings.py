import os

DATABASES = {

	'default': {
		'ENGINE': 'django.db.backends.postgresql',
		'HOST': os.environ.get('POSTGRES_HOST', 'localhost'),
		'PORT': os.environ.get('POSTGRES_PORT', '5432'),
		'NAME': os.environ.get('POSTGRES_DB'),
		'USER': os.environ.get('POSTGRES_USER'),
		'PASSWORD': os.environ.get('POSTGRES_PASSWORD'),
	}
}

ALLOWED_HOSTS = ['*']