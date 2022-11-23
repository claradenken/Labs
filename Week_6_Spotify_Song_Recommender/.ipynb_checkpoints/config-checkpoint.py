{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "886bb39e",
   "metadata": {},
   "outputs": [],
   "source": [
    "import spotipy\n",
    "from spotipy.oauth2 import SpotifyClientCredentials\n",
    "\n",
    "c_id = \"06f343fdaa6e402487ccba768fa45f13\"\n",
    "c_se =\"df7eb9d82f364716aba4b244cee1110b\"\n",
    "\n",
    "sp = spotipy.Spotify(auth_manager=SpotifyClientCredentials(client_id=c_id, client_secret=c_se))"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "Python 3 (ipykernel)",
   "language": "python",
   "name": "python3"
  },
  "language_info": {
   "codemirror_mode": {
    "name": "ipython",
    "version": 3
   },
   "file_extension": ".py",
   "mimetype": "text/x-python",
   "name": "python",
   "nbconvert_exporter": "python",
   "pygments_lexer": "ipython3",
   "version": "3.9.7"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
