<script setup>
  import { useMenuData } from '@/stores/data'
  const menuData = useMenuData()
</script>

<template>
  <div class="w-[41.615vw] h-[2.135vw] rounded-[0.208vw] bg-[#B6B2A973] flex items-center content-center justify-between p-[0.469vw]">
    <span class="font-['Regular'] text-[0.833vw] text-white">{{ menuData.Locales.OptimizePeds }}</span>
    <div class="relative inline-block w-[2vw] h-[1.23vw]">
      <input
        type="checkbox"
        id="switchx"
        :checked="!menuData.checkBoxData.OptimizePeds"
        @change="menuData.checkBoxData.OptimizePeds = !$event.target.checked"
        class="sr-only peer"
      />
      <label
        for="switchx"
        class="block w-full h-full bg-[#65AAFF] rounded-full cursor-pointer transition-colors duration-300 ease-in-out peer-checked:bg-white/25"
      ></label>

      <span
        class="pointer-events-none absolute top-[0.186vh] left-[0.864vw] w-[1vw] h-[1vw] bg-white rounded-full transition-all duration-300 ease-in-out peer-checked:left-[0.125vw]"
      ></span>
    </div>
  </div>
  <div class="w-[41.615vw] h-[2.135vw] rounded-[0.208vw] bg-[#B6B2A973] flex items-center content-center justify-between p-[0.469vw]">
    <span class="font-['Regular'] text-[0.833vw] text-white">{{ menuData.Locales.OptimizeObjects }}</span>
    <div class="relative inline-block w-[2vw] h-[1.23vw]">
      <input
        type="checkbox"
        id="switchxgf"
        class="sr-only peer"
        :checked="!menuData.checkBoxData.OptimizeObjects"
        @change="menuData.checkBoxData.OptimizeObjects = !$event.target.checked"
      />
      <label
        for="switchxgf"
        class="block w-full h-full bg-[#65AAFF] rounded-full cursor-pointer transition-colors duration-300 ease-in-out peer-checked:bg-white/25"
      ></label>

      <span
        class="pointer-events-none absolute top-[0.186vh] left-[0.864vw] w-[1vw] h-[1vw] bg-white rounded-full transition-all duration-300 ease-in-out peer-checked:left-[0.125vw]"
      ></span>
    </div>
  </div>
  <div class="w-[41.615vw] h-[2.135vw] rounded-[0.208vw] bg-[#B6B2A973] flex items-center content-center justify-between p-[0.469vw]">
    <span class="font-['Regular'] text-[0.833vw] text-white">{{ menuData.Locales.RemoveParticles }}</span>
    <div class="relative inline-block w-[2vw] h-[1.23vw]">
      <input
        type="checkbox"
        id="switchxgfd"
        :checked="!menuData.checkBoxData.RemoveParticles"
        @change="menuData.checkBoxData.RemoveParticles = !$event.target.checked"
        class="sr-only peer"
      />
      <label
        for="switchxgfd"
        class="block w-full h-full bg-[#65AAFF] rounded-full cursor-pointer transition-colors duration-300 ease-in-out peer-checked:bg-white/25"
      ></label>
      <span
        class="pointer-events-none absolute top-[0.186vh] left-[0.864vw] w-[1vw] h-[1vw] bg-white rounded-full transition-all duration-300 ease-in-out peer-checked:left-[0.125vw]"
      ></span>
    </div>
  </div>
</template>

<style scoped>

</style>
