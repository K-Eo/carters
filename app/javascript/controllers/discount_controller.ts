import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ['amount']

  amountTarget: HTMLElement

  connect() {
    this.update()
  }

  get withDiscount(): boolean {
    return this.data.get('with') === 'true'
  }

  set withDiscount(value: boolean) {
    this.data.set('with', value.toString())
  }

  toggle(): void {
    if (this.withDiscount) {
      this.withDiscount = false
    } else {
      this.withDiscount = true
    }

    this.update()
  }

  private update() {
    if (this.withDiscount) {
      this.amountTarget.classList.remove('d-none')
    } else {
      this.amountTarget.classList.add('d-none')
    }
  }
}
