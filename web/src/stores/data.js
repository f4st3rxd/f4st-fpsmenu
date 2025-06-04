import { defineStore } from 'pinia'
import { fetchNui } from '@/utils' 


export const useMenuData = defineStore('menuData', {
  state: () => {
    return {
      open: false,
      profilePhoto : "https://r2.fivemanage.com/UZIUKPXITXhPPI1r7Y6UE/muzan.png",
      playerName : "Alex Hard",
      currentPage : "main",
      fps : "FPS: 999",
      inputBoxData : "",

      checkBoxData : {
        OptimizePeds : false,
        OptimizeObjects : false,
        RemoveParticles : false,
        DisableRain : false,
        OptimizeShadows : false,
        OptimizeLights : false,
        LowRender : false,
        RemoveObjects : false,
        ClearPedDamage : false,
      },

      Locales : {
        Welcome : "Welcome",
        Main : "Main",
        World : "World",
        Other : "Other",
        Settings : "Settings",
        OptimizePeds : "Optimize Peds",
        OptimizeObjects : "Optimize Objects",
        RemoveParticles : "Remove Particles",
        DisableRain : "Disable Rain & Wind",
        OptimizeShadows : "Optimize Shadows",
        OptimizeLights : "Optimize Lights",
        LowRender : "Low Render & Textures",
        RemoveEmptyObjects : "Remove Empty And Broken Objects",
        ClearPedDamageAndDirt : "Clear Ped Damage And Dirt",
        ImportConfig : "Import Config",
        ExportConfig : "Export Config",
        SaveConfig : "Save Config",
        ResetConfig : "Reset Config",
        OpenAllOptions : "Open All Options (for trash pc's)"
      }
    }
  },

  actions: {
    toggleMenu(val) {
      this.open = val

      if (!val) {
        this.open = false
        this.currentPage = 'main'
        fetchNui('closeMenu')
      }
    },
    changePage(val) {
      if (val === this.currentPage) {
        return;
      }
      this.currentPage = 'x'
      setTimeout(() => {
        this.currentPage = val
      }, 550);
    },
    importConfig(data) {
       try {
           data = JSON.parse(data);
       } catch (e) {
           fetchNui('importNotify', false);
           return;
       }

       const requiredKeys = [
            "OptimizePeds",
            "OptimizeObjects",
            "RemoveParticles",
            "DisableRain",
            "OptimizeShadows",
            "OptimizeLights",
            "LowRender",
            "RemoveObjects",
            "ClearPedDamage",
        ];
    
        let isValid = true;
    
        requiredKeys.forEach(key => {
            if (!(key in data)) {
                isValid = false;
            } else {
                if (typeof data[key] !== 'boolean') {
                    isValid = false;
                }
            }
        });

        if (isValid) {
          this.checkBoxData = data;
          this.inputBoxData = "";
          fetchNui('importNotify', true);
        } else {
          this.inputBoxData = "";
          fetchNui('importNotify', false);
        }
    },
    copyDoiToClipboard (text  ) {
        const textarea = document.createElement('textarea');
        textarea.value = text;
        textarea.setAttribute('readonly', '');
        textarea.style.position = 'absolute';
        textarea.style.left = '-9999px';
        document.body.appendChild(textarea);
        textarea.select();

        const success = document.execCommand('copy');
        document.body.removeChild(textarea);
        if (success) {
          fetchNui('exportNotify')
        }
    },
    resetConfig() {
      this.checkBoxData = {
        OptimizePeds : false,
        OptimizeObjects : false,
        RemoveParticles : false,
        DisableRain : false,
        OptimizeShadows : false,
        OptimizeLights : false,
        LowRender : false,
        RemoveObjects : false,
        ClearPedDamage : false,
      }
      fetchNui('resetNotify')
    }

  }
})
