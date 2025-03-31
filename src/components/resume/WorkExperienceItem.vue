<script setup>

defineProps({
  company: {
    type: String,
    required: false
  },
  role: {
    type: String,
    required: true
  },
  location: {
    type: String,
    required: false
  },
  startDate: {
    type: String,
    required: true
  },
  endDate: {
    type: String,
    required: false
  },
  url: {
    type: String,
    required: false
  },
  summary: {
    type: String,
    required: false
  },
  items: {
    type: Array,
    required: false
  }
})
</script>

<template>
  <div class="item">
    <div class="header">
      <div class="role title">{{ role }}</div>
      <div class="separator details">/</div>
      <div class="details company">
        <a :href="url" target="_blank" :title="company" v-if="url">{{ company }}</a>
        <span v-else>{{ company }}</span>
      </div>
      <div class="separator details" v-if="location">|</div>
      <div class="location details">{{ location }}</div>
      <div class="time details">
        <span>{{ startDate }}</span>
        <span v-if="endDate"> - {{ endDate }}</span>
      </div>
    </div>
    <div class="description">
      <p class="summary" v-if="summary">{{ summary }}</p>
      <ul class="item-list" v-if="items">
        <li class="item" v-for="item in items" :key="item">{{ item }}</li>
      </ul>
    </div>
  </div>
</template>
