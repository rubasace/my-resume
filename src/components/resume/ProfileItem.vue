<script setup>

const props = defineProps({
  icon: {
    type: String,
    required: false
  },
  url: {
    type: String,
    required: false
  },
  text: {
    type: String,
    required: true
  },
  network: {
    type: String,
    required: false
  }
})


</script>

<template>
  <div class="profile">
    <i class="icon" :class="icon"></i>
    <a :href="url" target="_blank" :alt="network" class="title" v-if="url&&text">{{ text }}</a>
    <span class="title" v-else>{{ text?.length? text : url }}</span>
  </div>
</template>