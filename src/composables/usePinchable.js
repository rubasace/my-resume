import {computed, ref, watch} from 'vue'

export function usePinchable(elRef) {
    const scale = ref(1)
    const lastDistance = ref(null)
    const origin = ref({ x: 0, y: 0 })
    const translate = ref({ x: 0, y: 0 })

    function getDistance(touches) {
        const [a, b] = touches
        const dx = a.clientX - b.clientX
        const dy = a.clientY - b.clientY
        return Math.sqrt(dx * dx + dy * dy)
    }

    function getMidpoint(touches) {
        const [a, b] = touches
        return {
            x: (a.clientX + b.clientX) / 2,
            y: (a.clientY + b.clientY) / 2,
        }
    }

    function onTouchStart(e) {
        if (e.touches.length === 2) {
            lastDistance.value = getDistance(e.touches)
            origin.value = getMidpoint(e.touches)
        }
    }

    function onTouchMove(e) {
        if (e.touches.length === 2 && lastDistance.value != null) {
            const newDistance = getDistance(e.touches)
            const deltaScale = newDistance / lastDistance.value

            let newScale = scale.value * deltaScale
            newScale = Math.min(Math.max(newScale, 0.5), 3)

            const mid = getMidpoint(e.touches)
            const dx = mid.x - origin.value.x
            const dy = mid.y - origin.value.y

            translate.value.x += dx - dx * deltaScale
            translate.value.y += dy - dy * deltaScale

            scale.value = newScale
            lastDistance.value = newDistance
            origin.value = mid

            e.preventDefault()
        }
    }

    function onTouchEnd(e) {
        if (e.touches.length < 2) {
            lastDistance.value = null
        }
    }

    watch(elRef, el => {
        if (!el) return
        el.addEventListener('touchstart', onTouchStart, { passive: false })
        el.addEventListener('touchmove', onTouchMove, { passive: false })
        el.addEventListener('touchend', onTouchEnd)
    })

    const transform = computed(() =>
        `translate(${translate.value.x}px, ${translate.value.y}px) scale(${scale.value})`
    )

    return {
        scale,
        translate,
        transform,
    }
}
