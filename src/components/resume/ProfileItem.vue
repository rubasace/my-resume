<template lang="pug">
.item.profiles
  i.icon(:class="`${icon}`")
  span.title(v-if="title") {{title}}
  span.value {{items}}

</template>
<script setup>

defineProps({
  icon: {
    type: String,
    required: false
  },
  title: {
    type: String,
    required: false
  },
  value: {
    type: String,
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
<style scoped lang="sass">
.icon
  width: 1em
</style>