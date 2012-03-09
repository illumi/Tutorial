# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = []
users << User.create(
      :email => 'jamiespence2@gmail.com', 
      :password => 'testing', 
      :first_name => 'Jamie', 
      :last_name => 'Spence', 
      :admin => true
    )
users << User.create(
      :email => 'michaelrshannon@gmail.com', 
      :password => 'tesing', 
      :first_name => 'Michael', 
      :last_name => 'Shannon', 
      :admin => true
    )
    
Newsitem.create(
  :title => 'Welcome', 
  :content => 'Welcome to Jamie\'s tutorial website. This website is in development and this news item is generated from the initial seed data. Please view the available Subjects and associated tutorials by using the navigation bar above.',
  :user_id => users.first.id
)

subjects = []
subjects << Subject.create(
  :name => 'Glasgow Parallel Haskell', 
  :description => 'These tutorials assume previous knowlege of Haskell. There are already some good resources for learning Haskell online so reading some of the following might be a good idea. [Real World Haskell](http://book.realworldhaskell.org/read/) is available freely and is also available to buy as a book.'
)

Tutorial.create(
  :name => 'GpH Introduction', 
  :description => 'Introduction to Glasgow Parallel Haskell.',
  :content => 'Parallel computing is the simultaneous use of multiple compute resources to solve a computational problem to be run using multiple CPUs. Writing parallel programs requires specifying the algorithm and how to coordinate the computation of the algorithm.
A problem is broken into discrete parts that can be solved concurrently then each part is further broken down to a series of instructions. Instructions from each part execute simultaneously on different CPUs.

GpH does not explicitly deal with synchronisation or communication but GpH provides parallel composition to **hint** that an expression may usefully be evaluated by a parallel thread. We say x is *sparked*, and if there is an idle processor a thread may be created to evaluate it. We use Haskell\'s infix notation along with two primitives called `par` and `pseq` that are used as follows:

    x `par` y => y

The par combinator takes two arguments that are to be evaluated in parallel and suggests parallel computation can take place. the behaviour of par is to indicate that x could be evaluated by a new parallel thread, with the parent thread continuing evaluation of y. `x` gets **sparked** where a new thread is subsequently created to evaluate `x` if a processor becomes idle.

    x `pseq` y => y

GpH provides sequential composition to sequence computations and specify how much evaluation a thread should perform. This is useful because we need more control over the order of evaluation; we may want to evaluate `x` before `y`, because we know that `y` has already been sparked in parallel with `par`. `x` is evaluated to Weak Head Normal Form (WHNF) before returning `y`. 

The [`Control.Parallel`](http://hackage.haskell.org/packages/archive/parallel/3.2.0.2/doc/html/Control-Parallel.html) import gives access to these primitives in your programs. If you are a little unsure exactly what these primitives are for, reading the next sections on WHNF and GpH Introduction will make things clearer.
',
  :subject_id => subjects.first.id
)
Tutorial.create(
  :name => 'Normal Forms', 
  :description => 'Introduction to normal forms',
  :content => 'Normal forms are defined in terms of reducible expressions. An expressions that can be simplified e.g. `(+) 3 4` is reducible, but `7` is not. Strict languages such as SML and Java reduce all expressions to normal form.

Normal form (NF) is where an expression is completely evaluated and no sub-expression could be evaluated any further. These expressions are all in normal form:

    5
    [4,5,6]
    (2, "hello")

Weak head normal form (WHNF) is where an expression has been evaluated to the outermost data constructor or lambda abstraction. Sub-expressions may or may not have been evaluated. Therefore, every normal form expression is also in weak head normal form. These expressions are in weak head normal form:

    (1 + 1, 2 + 2)
    \'h\' : ("e" ++ "llo")

The following are not in WHNF

	1 + 2                -- the outermost part here is an application of (+)
	"he" ++ "llo"        -- the outermost part is an application of (++)

For more reading about WHNF there is a really good example on [Stackoverflow](http://stackoverflow.com/questions/6872898/haskell-what-is-weak-head-normal-form) which has a worked example using `foldl`.
',
  :subject_id => subjects.first.id
)
Tutorial.create(
  :name => 'Introducing parallelism', 
  :description => 'Your first GpH program!',
  :content => 'Factorial is a **divide and conquer** algorithm. Divide and Conquer algorithms are inherently parallel.

	pfact n = pfact\' 1 n
	
	pfact\' :: Integer -> Integer -> Integer
	pfact\' m n
		| m == n = m
		| otherwise = left `par` right `pseq` (left * right)
			where mid = (m + n) `div` 2
			left = pfact\' m mid
			right = pfact\' (mid+1) n

As described in the first tutorial, we control the evaluation order with `pseq` so that `left` and `right` are evaluated before we finally multiply the results. 

This function reads as follows: First spark `left` as a parallel thread for computing the expression `pfact\' m mid`. Then evaluate `right` which is the expression `pfact\' (mid+1) n`. Finally, evaluate the main expression `(left*right)`. If the sparked process `left` has not finished by the time `right` has evaluated, the main expression will be blocked until `left` has been evaluated.

Another example of a divide and conquer algorithm is a Fibonacci function. We will start with the sequential version and then parallelise it.

Sequential Version:

	nfib :: Int -> Int
	nfib 0 = 0
	nfib 1 = 1
	nfib n = nf1+nf2
         where nf1  = nfib (n-1)
               nf2  = nfib (n-2)

Here we see that `nf1` and `nf2` are recursively calling the `nfib` function. 

Parallel version:

	parfib :: Int -> Int
	parfib 0 = 0
	parfib 1 = 1
	parfib n = nf2 `par` nf1 `pseq` (nf1+nf2)
		where nf1 = parfib (n-1)
			  nf2 = parfib (n-2) 

With little change to the original sequential algorithm we have used `par` to suggest that `nf1` and `nf2` are evaluated in parallel. Again, as described in the first tutorial, we use `pseq` to control the evaluation order where `nf1` and `nf2` are evaluated before the final expression `(nf1+nf2+1)`.
',
  :subject_id => subjects.first.id
)
Tutorial.create(
  :name => 'Evaluation Strategies', 
  :description => 'Separating Computation and Coordination ',
  :content => 'To specify parallel coordination we must

1.  Introduce parallelism
1.  Specify Evaluation Order
1.  Specify Evaluation Degree

This is much less than most parallel paradigms, e.g. no communication or synchronisation. It is important that we do so without cluttering the program. In many parallel languages, e.g. C with MPI, coordination so dominates the program text that it obscures the computation. 

**Evaluation Strategies** abstract over `par` and `pseq`,

- raising the level of abstraction
- separating coordination and computation concerns

*It should be possible to understand the semantics of a function without considering its coordination behaviour.*

An evaluation strategy is a function that specifies the coordination required when computing a value of a given type, and preserves the value i.e. it is an identity function. 

	type Strategy a = a -> Eval a
	
	data Eval a = Done a

We provide a simple function to extract a value from `Eval`:

	runEval :: Eval a -> a
	runEval (Done a) = a
	
The return operator from the `Eval` monad will introduce a value into the monad:

	return :: a -> Eval a
	return x = Done x

###Applying Strategies

`using` applies a strategy to a value, e.g.

	using :: a -> Strategy a -> a 
	using x s = runEval (s x) 

A typical GpH function looks like: 

	somefun x y = someexpr `using` somestrat

###Simple Strategies

Simple strategies can now be defined.

`r0` performs no reduction at all. Used, for example, to evaluate only the first element but not the second of a pair.
`rseq` reduces its argument to Weak Head Normal Form (WHNF).
`rpar` sparks its argument.

	r0 :: Strategy a
	r0 x = Done x

	rseq :: Strategy a
	rseq x = x `pseq` Done x

	rpar :: Strategy a
	rpar x = x `par` Done x


[`Control.Parallel.Strategies`](http://hackage.haskell.org/packages/archive/parallel/3.2.0.2/doc/html/Control-Parallel-Strategies.html) imports the simple strategies above.

Both r0 and rseq control the evaluation degree of an expression. It is also often useful to reduce an expression to normal form (NF), i.e. a form that contains no redexes. We do this using the rnf strategy in a type class.

',
  :subject_id => subjects.first.id
)