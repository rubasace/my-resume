import { ref, onUnmounted, watch } from 'vue'

export function useDraggable(htmlElement) {
    const initialOffsetX = ref(0)
    const initialOffsetY = ref(0)
    const offsetX = ref(0)
    const offsetY = ref(0)
    const currentDragX = ref(0)
    const currentDragY = ref(0)
    const startX = ref(0)
    const startY = ref(0)
    const dragging = ref(false)

    function reset() {
        initialOffsetX.value = 0
        initialOffsetY.value = 0
        offsetX.value = 0
        offsetY.value = 0
        currentDragX.value = 0
        currentDragY.value = 0
        startX.value = 0
        startY.value = 0
        dragging.value = false
    }

    // Helper to get clientX/Y from mouse or touch
    function getClientCoords(e) {
        if (e.touches && e.touches.length > 0) {
            return {
                x: e.touches[0].clientX,
                y: e.touches[0].clientY
            }
        } else {
            return {
                x: e.clientX,
                y: e.clientY
            }
        }
    }

    function onStart(e) {
        const { x, y } = getClientCoords(e)
        dragging.value = true
        startX.value = x
        startY.value = y

        window.addEventListener('mousemove', onMove)
        window.addEventListener('mouseup', onEnd)
        window.addEventListener('touchmove', onMove, { passive: false })
        window.addEventListener('touchend', onEnd)
    }

    function onMove(e) {
        if (!dragging.value) return
        const { x, y } = getClientCoords(e)

        currentDragX.value = x - startX.value
        currentDragY.value = y - startY.value
        offsetX.value = initialOffsetX.value + currentDragX.value
        offsetY.value = initialOffsetY.value + currentDragY.value

        // Prevent page from scrolling while dragging on touch
        if (e.cancelable) e.preventDefault()
    }

    function onEnd() {
        if (!dragging.value) return
        dragging.value = false
        currentDragX.value = 0
        currentDragY.value = 0
        initialOffsetX.value = offsetX.value
        initialOffsetY.value = offsetY.value

        window.removeEventListener('mousemove', onMove)
        window.removeEventListener('mouseup', onEnd)
        window.removeEventListener('touchmove', onMove)
        window.removeEventListener('touchend', onEnd)
    }

    watch(htmlElement, (el) => {
        el?.addEventListener('mousedown', onStart)
        el?.addEventListener('touchstart', onStart, { passive: false })
    })

    onUnmounted(() => {
        htmlElement.value?.removeEventListener('mousedown', onStart)
        htmlElement.value?.removeEventListener('touchstart', onStart)
    })

    return {
        x: offsetX,
        y: offsetY,
        resetDragging: reset
    }
}