<template lang="pug">
.item.skills
  i.icon(v-if="icon", :class="`${icon}`")
  span.title(v-if="title") {{title}}
  span.value {{items}}

</template>
<script setup>

defineProps({
  icon: {
    type: Object,
    required: false
  },
  title: {
    type: String,
    required: false
  },
  value: {
    type: Object,
    required: true
  }
})
</script>
<script>
export default {
  computed: {
    items() {
      return Array.isArray(this.value) ? this.value.join(", ") + "." : this.value;
    }
  }
}
</script>