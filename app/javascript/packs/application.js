require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import 'bootstrap';
import { toggleReviewsForm } from '../components/toggle_form'
import { toggleDosesForm } from '../components/toggle_form'

console.log('re');
toggleReviewsForm()
toggleDosesForm()
