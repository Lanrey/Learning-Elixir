defmodule Cards do
  @moduledoc """
  Documentation for `Cards`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Cards.hello()
      :world

  """
  def hello do
    "hi there!!"
  end

  @doc """
  Create Deck

  ## Examples
    iex> Cards.create_deck()
    ["Ace", "Two", "Three"]
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]


    for value <- values, suit <- suits do
      "#{value} of #{suit}"
    end

  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(fileaname) do

    case File.read(fileaname) do
      {:ok, binary } -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "That file doesn't exists"
    end
  end

  def create_hand(hand_size) do

    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end
