<script setup>
import Title from "@/components/resume/Title.vue";

defineProps({
  name: {
    type: String,
    required: true
  },
  url: {
    type: String,
    required: false
  },
  startDate: {
    type: String,
    required: false
  },
  endDate: {
    type: String,
    required: false
  },
  description: {
    type: String,
    required: false
  },
  highlights: {
    type: Array,
    required: false
  }
})
</script>
<template>
  <div class="item">
    <div class="header">
      <Title :text="name" :url="url"/>
      <span class="time details">
        <span>{{ startDate }}</span>
        <span v-if="endDate"> - {{ endDate }}</span>
      </span>
    </div>
    <div class="description">
      <p class="description" v-if="description">{{ description }}</p>
      <ul class="item-list" v-if="highlights">
        <li class="highlight" v-for="highlight in highlights">{{ highlight }}</li>
      </ul>
    </div>
  </div>
</template>
