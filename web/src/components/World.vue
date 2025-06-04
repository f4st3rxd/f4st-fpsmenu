<script setup>
  import { useMenuData } from '@/stores/data'
  const menuData = useMenuData()
</script>

<template>
  <div class="w-[41.615vw] h-[2.135vw] rounded-[0.208vw] bg-[#B6B2A973] flex items-center content-center justify-between p-[0.469vw]">
    <span class="font-['Regular'] text-[0.833vw] text-white">{{ menuData.Locales.DisableRain }}</span>
    <div class="relative inline-block w-[2vw] h-[1.23vw]">
      <input
        type="checkbox"
        id="switchgsfdgx"
        :checked="!menuData.checkBoxData.DisableRain"
        @change="menuData.checkBoxData.DisableRain = !$event.target.checked"
        class="sr-only peer"
      />
      <label
        for="switchgsfdgx"
        class="block w-full h-full bg-[#65AAFF] rounded-full cursor-pointer transition-colors duration-300 ease-in-out peer-checked:bg-white/25"
      ></label>

      <span
        class="pointer-events-none absolute top-[0.186vh] left-[0.864vw] w-[1vw] h-[1vw] bg-white rounded-full transition-all duration-300 ease-in-out peer-checked:left-[0.125vw]"
      ></span>
    </div>
  </div>
  <div class="w-[41.615vw] h-[2.135vw] rounded-[0.208vw] bg-[#B6B2A973] flex items-center content-center justify-between p-[0.469vw]">
    <span class="font-['Regular'] text-[0.833vw] text-white">{{ menuData.Locales.OptimizeShadows }}</span>
    <div class="relative inline-block w-[2vw] h-[1.23vw]">
      <input
        type="checkbox"
        id="switchgsfdgx2"
        :checked="!menuData.checkBoxData.OptimizeShadows"
        @change="menuData.checkBoxData.OptimizeShadows = !$event.target.checked"
        class="sr-only peer"
      />
      <label
        for="switchgsfdgx2"
        class="block w-full h-full bg-[#65AAFF] rounded-full cursor-pointer transition-colors duration-300 ease-in-out peer-checked:bg-white/25"
      ></label>

      <span
        class="pointer-events-none absolute top-[0.186vh] left-[0.864vw] w-[1vw] h-[1vw] bg-white rounded-full transition-all duration-300 ease-in-out peer-checked:left-[0.125vw]"
      ></span>
    </div>
  </div>
  <div class="w-[41.615vw] h-[2.135vw] rounded-[0.208vw] bg-[#B6B2A973] flex items-center content-center justify-between p-[0.469vw]">
    <span class="font-['Regular'] text-[0.833vw] text-white">{{ menuData.Locales.OptimizeLights }}</span>
    <div class="relative inline-block w-[2vw] h-[1.23vw]">
      <input
        type="checkbox"
        id="switchgsfdgx23"
        :checked="!menuData.checkBoxData.OptimizeLights"
        @change="menuData.checkBoxData.OptimizeLights = !$event.target.checked"
        class="sr-only peer"
      />
      <label
        for="switchgsfdgx23"
        class="block w-full h-full bg-[#65AAFF] rounded-full cursor-pointer transition-colors duration-300 ease-in-out peer-checked:bg-white/25"
      ></label>

      <span
        class="pointer-events-none absolute top-[0.186vh] left-[0.864vw] w-[1vw] h-[1vw] bg-white rounded-full transition-all duration-300 ease-in-out peer-checked:left-[0.125vw]"
      ></span>
    </div>
  </div>
  <div class="w-[41.615vw] h-[2.135vw] rounded-[0.208vw] bg-[#B6B2A973] flex items-center content-center justify-between p-[0.469vw]">
    <span class="font-['Regular'] text-[0.833vw] text-white">{{ menuData.Locales.LowRender }}</span>
    <div class="relative inline-block w-[2vw] h-[1.23vw]">
      <input
        type="checkbox"
        id="switchgsfdgx2ss3"
        :checked="!menuData.checkBoxData.LowRender"
        @change="menuData.checkBoxData.LowRender = !$event.target.checked"
        class="sr-only peer"
      />
      <label
        for="switchgsfdgx2ss3"
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
