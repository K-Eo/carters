import { Controller } from 'stimulus'

const STATE_EXPANDED = 'expanded'
const STATE_COLLAPSED = 'collapsed'

export default class extends Controller {
  static targets = ['nav', 'left', 'right']

  navTarget: HTMLElement
  leftTarget: HTMLElement
  rightTarget: HTMLElement

  initialize(): void {
    this.update()
  }

  get state(): string {
    return this.data.get('state')
  }

  set state(value: string) {
    this.data.set('state', value)
    this.update()
  }

  toggle(): void {
    if (this.state === STATE_EXPANDED) {
      this.state = STATE_COLLAPSED
    } else {
      this.state = STATE_EXPANDED
    }
  }

  private update(): void {
    if (this.state === STATE_EXPANDED) {
      this.expand()
    } else {
      this.collapse()
    }
  }

  private collapse(): void {
    this.element.classList.add('wrapper-collapsed')
    this.navTarget.classList.add('sidebar-wrapper-collapsed')
    this.leftTarget.classList.add('d-none')
    this.rightTarget.classList.remove('d-none')
  }

  private expand(): void {
    this.element.classList.remove('wrapper-collapsed')
    this.navTarget.classList.remove('sidebar-wrapper-collapsed')
    this.leftTarget.classList.remove('d-none')
    this.rightTarget.classList.add('d-none')
  }
}
