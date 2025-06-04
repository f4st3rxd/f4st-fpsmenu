import { useMenuData } from '@/stores/data'

export default function () {
  const menuData = useMenuData()

  window.addEventListener('message', ({ data }) => {
    switch (data.action) {
      case 'openMenu':
        menuData.toggleMenu(true)
        break
      case 'loadData':
        menuData.profilePhoto = data.photo
        menuData.playerName = data.name 
        break
      case 'updateFps':
        menuData.fps = data.fps
        break
      case 'loadSettings':
        menuData.Locales = data.locales
        menuData.checkBoxData = data.data
        break
      default:
        break
    }
  })
}
