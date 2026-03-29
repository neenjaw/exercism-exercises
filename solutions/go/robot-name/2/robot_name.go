package robotname

import (
	"math/rand"
	"strings"
	"time"
)

const alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
const number = "1234567890"

// Robot struct represents a robot with a name
type Robot struct {
	name *string
}

func init() {
	rand.Seed(time.Now().UTC().UnixNano())
}

// Name returns the robot's name
func (r *Robot) Name() (string, error) {
	if r.name == nil {
		name := makeName()
		r.name = &name
	}

	return *(r.name), nil
}

// Reset resets the robot's name
func (r *Robot) Reset() {
	r.name = nil
}

func makeName() string {
	var sb strings.Builder

	sb.WriteByte(randLetter())
	sb.WriteByte(randLetter())
	sb.WriteByte(randNumber())
	sb.WriteByte(randNumber())
	sb.WriteByte(randNumber())

	return sb.String()
}

func randLetter() byte {
	return alphabet[rand.Intn(len(alphabet))]
}

func randNumber() byte {
	return number[rand.Intn(len(number))]
}
